.class public final Lkotlin/ranges/LongRange;
.super Lkotlin/ranges/LongProgression;
.source "PrimitiveRanges.kt"

# interfaces
.implements Lkotlin/ranges/ClosedRange;
.implements Lkotlin/ranges/OpenEndRange;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/ranges/LongRange$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/ranges/LongProgression;",
        "Lkotlin/ranges/ClosedRange<",
        "Ljava/lang/Long;",
        ">;",
        "Lkotlin/ranges/OpenEndRange<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0018\u0000 $2\u00020\u00012\u0008\u0012\u0004\u0012\u00020\u00030\u00022\u0008\u0012\u0004\u0012\u00020\u00030\u0004:\u0001$B\u0019\u0008F\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0012\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u0003H\u0096\u0082\u0004J\n\u0010\u001c\u001a\u00020\u001aH\u0096\u0080\u0004J\u0014\u0010\u001d\u001a\u00020\u001a2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001fH\u0096\u0082\u0004J\n\u0010 \u001a\u00020!H\u0096\u0080\u0004J\n\u0010\"\u001a\u00020#H\u0096\u0080\u0004R\u0015\u0010\u0005\u001a\u00020\u00038VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\t\u0010\nR\u0015\u0010\u0006\u001a\u00020\u00038VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u000b\u0010\nRI\u0010\u000c\u001a\u00020\u00038VX\u0097\u0084\u0008r\u000c\u0008\u0010\u0012\u0008\u0008\u0011\u0012\u0004\u0008\u0008(\u0012r\u000c\u0008\u0013\u0012\u0008\u0008\u0014\u0012\u0004\u0008\u0008(\u0015r\u0010\u0008\u0016\u0012\u000c\u0008\u0017\u0012\u0008\u0008\u000cJ\u0004\u0008\t0\u0018\u00a2\u0006\u000c\u0012\u0004\u0008\r\u0010\u000e\u001a\u0004\u0008\u000f\u0010\n\u00a8\u0006%"
    }
    d2 = {
        "Lkotlin/ranges/LongRange;",
        "Lkotlin/ranges/LongProgression;",
        "Lkotlin/ranges/ClosedRange;",
        "",
        "Lkotlin/ranges/OpenEndRange;",
        "start",
        "endInclusive",
        "<init>",
        "(JJ)V",
        "getStart",
        "()Ljava/lang/Long;",
        "getEndInclusive",
        "endExclusive",
        "getEndExclusive$annotations",
        "()V",
        "getEndExclusive",
        "Lkotlin/Deprecated;",
        "message",
        "Can throw an exception when it\'s impossible to represent the value with Long type, for example, when the range includes MAX_VALUE. It\'s recommended to use \'endInclusive\' property that doesn\'t throw.",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.9",
        "Lkotlin/WasExperimental;",
        "markerClass",
        "Lkotlin/ExperimentalStdlibApi;",
        "contains",
        "",
        "value",
        "isEmpty",
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
.field public static final Companion:Lkotlin/ranges/LongRange$Companion;

.field private static final EMPTY:Lkotlin/ranges/LongRange;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lkotlin/ranges/LongRange$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/ranges/LongRange$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/ranges/LongRange;->Companion:Lkotlin/ranges/LongRange$Companion;

    .line 125
    new-instance v0, Lkotlin/ranges/LongRange;

    const-wide/16 v1, 0x1

    const-wide/16 v3, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lkotlin/ranges/LongRange;-><init>(JJ)V

    sput-object v0, Lkotlin/ranges/LongRange;->EMPTY:Lkotlin/ranges/LongRange;

    return-void
.end method

.method public constructor <init>(JJ)V
    .registers 12

    const-wide/16 v5, 0x1

    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    .line 93
    invoke-direct/range {v0 .. v6}, Lkotlin/ranges/LongProgression;-><init>(JJJ)V

    return-void
.end method

.method public static final synthetic access$getEMPTY$cp()Lkotlin/ranges/LongRange;
    .registers 1

    .line 93
    sget-object v0, Lkotlin/ranges/LongRange;->EMPTY:Lkotlin/ranges/LongRange;

    return-object v0
.end method

.method public static synthetic getEndExclusive$annotations()V
    .registers 0
    .annotation runtime Lkotlin/Deprecated;
        message = "Can throw an exception when it\'s impossible to represent the value with Long type, for example, when the range includes MAX_VALUE. It\'s recommended to use \'endInclusive\' property that doesn\'t throw."
    .end annotation

    return-void
.end method


# virtual methods
.method public contains(J)Z
    .registers 5

    .line 105
    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getFirst()J

    move-result-wide v0

    cmp-long v0, v0, p1

    if-gtz v0, :cond_12

    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getLast()J

    move-result-wide v0

    cmp-long p0, p1, v0

    if-gtz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic contains(Ljava/lang/Comparable;)Z
    .registers 4

    .line 93
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lkotlin/ranges/LongRange;->contains(J)Z

    move-result p0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    .line 115
    instance-of v0, p1, Lkotlin/ranges/LongRange;

    if-eqz v0, :cond_2f

    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lkotlin/ranges/LongRange;

    invoke-virtual {v0}, Lkotlin/ranges/LongRange;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2d

    .line 116
    :cond_13
    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getFirst()J

    move-result-wide v0

    check-cast p1, Lkotlin/ranges/LongRange;

    invoke-virtual {p1}, Lkotlin/ranges/LongRange;->getFirst()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_2f

    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getLast()J

    move-result-wide v0

    invoke-virtual {p1}, Lkotlin/ranges/LongRange;->getLast()J

    move-result-wide p0

    cmp-long p0, v0, p0

    if-nez p0, :cond_2f

    :cond_2d
    const/4 p0, 0x1

    return p0

    :cond_2f
    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic getEndExclusive()Ljava/lang/Comparable;
    .registers 1

    .line 93
    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getEndExclusive()Ljava/lang/Long;

    move-result-object p0

    check-cast p0, Ljava/lang/Comparable;

    return-object p0
.end method

.method public getEndExclusive()Ljava/lang/Long;
    .registers 5

    .line 101
    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getLast()J

    move-result-wide v0

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v0, v0, v2

    if-eqz v0, :cond_19

    .line 102
    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getLast()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    .line 101
    :cond_19
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Cannot return the exclusive upper bound of a range that includes MAX_VALUE."

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public bridge synthetic getEndInclusive()Ljava/lang/Comparable;
    .registers 1

    .line 93
    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getEndInclusive()Ljava/lang/Long;

    move-result-object p0

    check-cast p0, Ljava/lang/Comparable;

    return-object p0
.end method

.method public getEndInclusive()Ljava/lang/Long;
    .registers 3

    .line 95
    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getLast()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getStart()Ljava/lang/Comparable;
    .registers 1

    .line 93
    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getStart()Ljava/lang/Long;

    move-result-object p0

    check-cast p0, Ljava/lang/Comparable;

    return-object p0
.end method

.method public getStart()Ljava/lang/Long;
    .registers 3

    .line 94
    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getFirst()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public hashCode()I
    .registers 4

    .line 119
    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, -0x1

    return p0

    :cond_8
    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getFirst()J

    move-result-wide v0

    invoke-static {v0, v1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(J)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getLast()J

    move-result-wide v1

    invoke-static {v1, v2}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(J)I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method public isEmpty()Z
    .registers 5

    .line 112
    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getFirst()J

    move-result-wide v0

    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getLast()J

    move-result-wide v2

    cmp-long p0, v0, v2

    if-lez p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getFirst()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ".."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lkotlin/ranges/LongRange;->getLast()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
