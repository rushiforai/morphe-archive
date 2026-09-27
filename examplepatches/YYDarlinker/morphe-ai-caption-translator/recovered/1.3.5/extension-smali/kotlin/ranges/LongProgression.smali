.class public Lkotlin/ranges/LongProgression;
.super Ljava/lang/Object;
.source "Progressions.kt"

# interfaces
.implements Ljava/lang/Iterable;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/ranges/LongProgression$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Ljava/lang/Long;",
        ">;",
        "Lkotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u001c\n\u0002\u0010\t\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0008\u0016\u0018\u0000 \u00192\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0019B!\u0008@\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\n\u0010\u000e\u001a\u00020\u000fH\u0096\u0082\u0004J\n\u0010\u0010\u001a\u00020\u0011H\u0096\u0080\u0004J\u0014\u0010\u0012\u001a\u00020\u00112\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0014H\u0096\u0082\u0004J\n\u0010\u0015\u001a\u00020\u0016H\u0096\u0080\u0004J\n\u0010\u0017\u001a\u00020\u0018H\u0096\u0080\u0004R\u0015\u0010\u0008\u001a\u00020\u0002X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0015\u0010\u000b\u001a\u00020\u0002X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\nR\u0015\u0010\u0005\u001a\u00020\u0002X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\n\u00a8\u0006\u001a"
    }
    d2 = {
        "Lkotlin/ranges/LongProgression;",
        "",
        "",
        "start",
        "endInclusive",
        "step",
        "<init>",
        "(JJJ)V",
        "first",
        "getFirst",
        "()J",
        "last",
        "getLast",
        "getStep",
        "iterator",
        "Lkotlin/collections/LongIterator;",
        "isEmpty",
        "",
        "equals",
        "other",
        "",
        "hashCode",
        "",
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
.field public static final Companion:Lkotlin/ranges/LongProgression$Companion;


# instance fields
.field private final first:J

.field private final last:J

.field private final step:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkotlin/ranges/LongProgression$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/ranges/LongProgression$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/ranges/LongProgression;->Companion:Lkotlin/ranges/LongProgression$Companion;

    return-void
.end method

.method public constructor <init>(JJJ)V
    .registers 9

    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    cmp-long v0, p5, v0

    if-eqz v0, :cond_22

    const-wide/high16 v0, -0x8000000000000000L

    cmp-long v0, p5, v0

    if-eqz v0, :cond_1a

    .line 156
    iput-wide p1, p0, Lkotlin/ranges/LongProgression;->first:J

    .line 161
    invoke-static/range {p1 .. p6}, Lkotlin/internal/ProgressionUtilKt;->getProgressionLastElement(JJJ)J

    move-result-wide p1

    iput-wide p1, p0, Lkotlin/ranges/LongProgression;->last:J

    .line 166
    iput-wide p5, p0, Lkotlin/ranges/LongProgression;->step:J

    return-void

    .line 150
    :cond_1a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Step must be greater than Long.MIN_VALUE to avoid overflow on negation."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 149
    :cond_22
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Step must be non-zero."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    .line 179
    instance-of v0, p1, Lkotlin/ranges/LongProgression;

    if-eqz v0, :cond_2f

    invoke-virtual {p0}, Lkotlin/ranges/LongProgression;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lkotlin/ranges/LongProgression;

    invoke-virtual {v0}, Lkotlin/ranges/LongProgression;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2d

    .line 180
    :cond_13
    iget-wide v0, p0, Lkotlin/ranges/LongProgression;->first:J

    check-cast p1, Lkotlin/ranges/LongProgression;

    iget-wide v2, p1, Lkotlin/ranges/LongProgression;->first:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_2f

    iget-wide v0, p0, Lkotlin/ranges/LongProgression;->last:J

    iget-wide v2, p1, Lkotlin/ranges/LongProgression;->last:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_2f

    iget-wide v0, p0, Lkotlin/ranges/LongProgression;->step:J

    iget-wide p0, p1, Lkotlin/ranges/LongProgression;->step:J

    cmp-long p0, v0, p0

    if-nez p0, :cond_2f

    :cond_2d
    const/4 p0, 0x1

    return p0

    :cond_2f
    const/4 p0, 0x0

    return p0
.end method

.method public final getFirst()J
    .registers 3

    .line 156
    iget-wide v0, p0, Lkotlin/ranges/LongProgression;->first:J

    return-wide v0
.end method

.method public final getLast()J
    .registers 3

    .line 161
    iget-wide v0, p0, Lkotlin/ranges/LongProgression;->last:J

    return-wide v0
.end method

.method public final getStep()J
    .registers 3

    .line 166
    iget-wide v0, p0, Lkotlin/ranges/LongProgression;->step:J

    return-wide v0
.end method

.method public hashCode()I
    .registers 4

    .line 183
    invoke-virtual {p0}, Lkotlin/ranges/LongProgression;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, -0x1

    return p0

    :cond_8
    iget-wide v0, p0, Lkotlin/ranges/LongProgression;->first:J

    invoke-static {v0, v1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(J)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, Lkotlin/ranges/LongProgression;->last:J

    invoke-static {v1, v2}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(J)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, Lkotlin/ranges/LongProgression;->step:J

    invoke-static {v1, v2}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(J)I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method public isEmpty()Z
    .registers 8

    .line 176
    iget-wide v0, p0, Lkotlin/ranges/LongProgression;->step:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    iget-wide v1, p0, Lkotlin/ranges/LongProgression;->first:J

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-wide v5, p0, Lkotlin/ranges/LongProgression;->last:J

    cmp-long p0, v1, v5

    if-lez v0, :cond_14

    if-lez p0, :cond_13

    return v3

    :cond_13
    return v4

    :cond_14
    if-gez p0, :cond_17

    return v3

    :cond_17
    return v4
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 1

    .line 141
    invoke-virtual {p0}, Lkotlin/ranges/LongProgression;->iterator()Lkotlin/collections/LongIterator;

    move-result-object p0

    check-cast p0, Ljava/util/Iterator;

    return-object p0
.end method

.method public iterator()Lkotlin/collections/LongIterator;
    .registers 8

    .line 168
    new-instance v0, Lkotlin/ranges/LongProgressionIterator;

    iget-wide v1, p0, Lkotlin/ranges/LongProgression;->first:J

    iget-wide v3, p0, Lkotlin/ranges/LongProgression;->last:J

    iget-wide v5, p0, Lkotlin/ranges/LongProgression;->step:J

    invoke-direct/range {v0 .. v6}, Lkotlin/ranges/LongProgressionIterator;-><init>(JJJ)V

    check-cast v0, Lkotlin/collections/LongIterator;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .line 185
    iget-wide v0, p0, Lkotlin/ranges/LongProgression;->step:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    iget-wide v1, p0, Lkotlin/ranges/LongProgression;->first:J

    const-string v3, " step "

    if-lez v0, :cond_2b

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ".."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lkotlin/ranges/LongProgression;->last:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lkotlin/ranges/LongProgression;->step:J

    :goto_23
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " downTo "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lkotlin/ranges/LongProgression;->last:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lkotlin/ranges/LongProgression;->step:J

    neg-long v1, v1

    goto :goto_23
.end method
