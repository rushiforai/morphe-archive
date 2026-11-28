.class public Lnicoid/network238/kotlin/ranges/LongProgression;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Iterable;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/ranges/LongProgression$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/kotlin/ranges/LongProgression$Companion;


# instance fields
.field private final first:J

.field private final last:J

.field private final step:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/kotlin/ranges/LongProgression$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/ranges/LongProgression$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/kotlin/ranges/LongProgression;->Companion:Lnicoid/network238/kotlin/ranges/LongProgression$Companion;

    return-void
.end method

.method public constructor <init>(JJJ)V
    .registers 9

    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    cmp-long v0, p5, v0

    if-eqz v0, :cond_1

    const-wide/high16 v0, -0x8000000000000000L

    cmp-long v0, p5, v0

    if-eqz v0, :cond_0

    .line 155
    iput-wide p1, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->first:J

    .line 160
    invoke-static/range {p1 .. p6}, Lnicoid/network238/kotlin/internal/ProgressionUtilKt;->getProgressionLastElement(JJJ)J

    move-result-wide p1

    iput-wide p1, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->last:J

    .line 165
    iput-wide p5, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->step:J

    return-void

    .line 149
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Step must be greater than Long.MIN_VALUE to avoid overflow on negation."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 148
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Step must be non-zero."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    .line 178
    instance-of v0, p1, Lnicoid/network238/kotlin/ranges/LongProgression;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lnicoid/network238/kotlin/ranges/LongProgression;

    invoke-virtual {v0}, Lnicoid/network238/kotlin/ranges/LongProgression;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 179
    :cond_0
    iget-wide v0, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->first:J

    check-cast p1, Lnicoid/network238/kotlin/ranges/LongProgression;

    iget-wide v2, p1, Lnicoid/network238/kotlin/ranges/LongProgression;->first:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    iget-wide v0, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->last:J

    iget-wide v2, p1, Lnicoid/network238/kotlin/ranges/LongProgression;->last:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    iget-wide v0, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->step:J

    iget-wide v2, p1, Lnicoid/network238/kotlin/ranges/LongProgression;->step:J

    cmp-long p1, v0, v2

    if-nez p1, :cond_1

    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public final getFirst()J
    .registers 3

    .line 155
    iget-wide v0, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->first:J

    return-wide v0
.end method

.method public final getLast()J
    .registers 3

    .line 160
    iget-wide v0, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->last:J

    return-wide v0
.end method

.method public final getStep()J
    .registers 3

    .line 165
    iget-wide v0, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->step:J

    return-wide v0
.end method

.method public hashCode()I
    .registers 10

    .line 182
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    iget-wide v0, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->first:J

    const/16 v2, 0x20

    ushr-long v3, v0, v2

    xor-long/2addr v0, v3

    const-wide/16 v3, 0x1f

    mul-long/2addr v0, v3

    iget-wide v5, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->last:J

    ushr-long v7, v5, v2

    xor-long/2addr v5, v7

    add-long/2addr v0, v5

    mul-long/2addr v0, v3

    iget-wide v3, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->step:J

    ushr-long v5, v3, v2

    xor-long/2addr v3, v5

    add-long/2addr v0, v3

    long-to-int v0, v0

    return v0
.end method

.method public isEmpty()Z
    .registers 6

    .line 175
    iget-wide v0, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->step:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    iget-wide v1, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->first:J

    iget-wide v3, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->last:J

    if-lez v0, :cond_0

    cmp-long v0, v1, v3

    if-lez v0, :cond_1

    goto :goto_0

    :cond_0
    cmp-long v0, v1, v3

    if-gez v0, :cond_1

    :goto_0
    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 2

    .line 140
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->iterator()Lnicoid/network238/kotlin/collections/LongIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Lnicoid/network238/kotlin/collections/LongIterator;
    .registers 8

    .line 167
    new-instance v0, Lnicoid/network238/kotlin/ranges/LongProgressionIterator;

    iget-wide v1, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->first:J

    iget-wide v3, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->last:J

    iget-wide v5, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->step:J

    invoke-direct/range {v0 .. v6}, Lnicoid/network238/kotlin/ranges/LongProgressionIterator;-><init>(JJJ)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .line 184
    iget-wide v0, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->step:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    iget-wide v1, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->first:J

    const-string v3, " step "

    if-lez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->last:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->step:J

    :goto_0
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " downTo "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->last:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lnicoid/network238/kotlin/ranges/LongProgression;->step:J

    neg-long v1, v1

    goto :goto_0
.end method
