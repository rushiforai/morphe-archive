.class public final Lkotlin/ranges/ULongRange;
.super Lkotlin/ranges/ULongProgression;
.source "ULongRange.kt"

# interfaces
.implements Lkotlin/ranges/ClosedRange;
.implements Lkotlin/ranges/OpenEndRange;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/ranges/ULongRange$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/ranges/ULongProgression;",
        "Lkotlin/ranges/ClosedRange<",
        "Lkotlin/ULong;",
        ">;",
        "Lkotlin/ranges/OpenEndRange<",
        "Lkotlin/ULong;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0008\u0007\u0018\u0000 &2\u00020\u00012\u0008\u0012\u0004\u0012\u00020\u00030\u00022\u0008\u0012\u0004\u0012\u00020\u00030\u0004:\u0001&B\u0019\u0008F\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0019\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u0003H\u0096\u0082\u0004\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\n\u0010\u001e\u001a\u00020\u001aH\u0096\u0080\u0004J\u0014\u0010\u001f\u001a\u00020\u001a2\u0008\u0010 \u001a\u0004\u0018\u00010!H\u0096\u0082\u0004J\n\u0010\"\u001a\u00020#H\u0096\u0080\u0004J\n\u0010$\u001a\u00020%H\u0096\u0080\u0004R\u0015\u0010\u0005\u001a\u00020\u00038VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\t\u0010\nR\u0015\u0010\u0006\u001a\u00020\u00038VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u000b\u0010\nRI\u0010\u000c\u001a\u00020\u00038VX\u0097\u0084\u0008r\u000c\u0008\u0010\u0012\u0008\u0008\u0011\u0012\u0004\u0008\u0008(\u0012r\u000c\u0008\u0013\u0012\u0008\u0008\u0014\u0012\u0004\u0008\u0008(\u0015r\u0010\u0008\u0016\u0012\u000c\u0008\u0017\u0012\u0008\u0008\u000cJ\u0004\u0008\t0\u0018\u00a2\u0006\u000c\u0012\u0004\u0008\r\u0010\u000e\u001a\u0004\u0008\u000f\u0010\n\u00ca\u0001\u000c\u0008\u0013\u0012\u0008\u0008\u0014\u0012\u0004\u0008\u0008((\u00a8\u0006\'"
    }
    d2 = {
        "Lkotlin/ranges/ULongRange;",
        "Lkotlin/ranges/ULongProgression;",
        "Lkotlin/ranges/ClosedRange;",
        "Lkotlin/ULong;",
        "Lkotlin/ranges/OpenEndRange;",
        "start",
        "endInclusive",
        "<init>",
        "(JJLkotlin/jvm/internal/DefaultConstructorMarker;)V",
        "getStart-s-VKNKU",
        "()J",
        "getEndInclusive-s-VKNKU",
        "endExclusive",
        "getEndExclusive-s-VKNKU$annotations",
        "()V",
        "getEndExclusive-s-VKNKU",
        "Lkotlin/Deprecated;",
        "message",
        "Can throw an exception when it\'s impossible to represent the value with ULong type, for example, when the range includes MAX_VALUE. It\'s recommended to use \'endInclusive\' property that doesn\'t throw.",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.9",
        "Lkotlin/WasExperimental;",
        "markerClass",
        "Lkotlin/ExperimentalStdlibApi;",
        "contains",
        "",
        "value",
        "contains-VKZWuLQ",
        "(J)Z",
        "isEmpty",
        "equals",
        "other",
        "",
        "hashCode",
        "",
        "toString",
        "",
        "Companion",
        "kotlin-stdlib",
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
.field public static final Companion:Lkotlin/ranges/ULongRange$Companion;

.field private static final EMPTY:Lkotlin/ranges/ULongRange;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lkotlin/ranges/ULongRange$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/ranges/ULongRange$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/ranges/ULongRange;->Companion:Lkotlin/ranges/ULongRange$Companion;

    .line 51
    new-instance v2, Lkotlin/ranges/ULongRange;

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    const-wide/16 v3, -0x1

    invoke-direct/range {v2 .. v7}, Lkotlin/ranges/ULongRange;-><init>(JJLkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v2, Lkotlin/ranges/ULongRange;->EMPTY:Lkotlin/ranges/ULongRange;

    return-void
.end method

.method private constructor <init>(JJ)V
    .registers 13

    const-wide/16 v5, 0x1

    const/4 v7, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    .line 18
    invoke-direct/range {v0 .. v7}, Lkotlin/ranges/ULongProgression;-><init>(JJJLkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public synthetic constructor <init>(JJLkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 6

    invoke-direct {p0, p1, p2, p3, p4}, Lkotlin/ranges/ULongRange;-><init>(JJ)V

    return-void
.end method

.method public static final synthetic access$getEMPTY$cp()Lkotlin/ranges/ULongRange;
    .registers 1

    .line 18
    sget-object v0, Lkotlin/ranges/ULongRange;->EMPTY:Lkotlin/ranges/ULongRange;

    return-object v0
.end method

.method public static synthetic getEndExclusive-s-VKNKU$annotations()V
    .registers 0
    .annotation runtime Lkotlin/Deprecated;
        message = "Can throw an exception when it\'s impossible to represent the value with ULong type, for example, when the range includes MAX_VALUE. It\'s recommended to use \'endInclusive\' property that doesn\'t throw."
    .end annotation

    return-void
.end method


# virtual methods
.method public bridge synthetic contains(Ljava/lang/Comparable;)Z
    .registers 4

    .line 18
    check-cast p1, Lkotlin/ULong;

    invoke-virtual {p1}, Lkotlin/ULong;->unbox-impl()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lkotlin/ranges/ULongRange;->contains-VKZWuLQ(J)Z

    move-result p0

    return p0
.end method

.method public contains-VKZWuLQ(J)Z
    .registers 5

    .line 31
    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getFirst-s-VKNKU()J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)I

    move-result v0

    if-gtz v0, :cond_16

    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getLast-s-VKNKU()J

    move-result-wide v0

    invoke-static {p1, p2, v0, v1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)I

    move-result p0

    if-gtz p0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    .line 41
    instance-of v0, p1, Lkotlin/ranges/ULongRange;

    if-eqz v0, :cond_2f

    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lkotlin/ranges/ULongRange;

    invoke-virtual {v0}, Lkotlin/ranges/ULongRange;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2d

    .line 42
    :cond_13
    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getFirst-s-VKNKU()J

    move-result-wide v0

    check-cast p1, Lkotlin/ranges/ULongRange;

    invoke-virtual {p1}, Lkotlin/ranges/ULongRange;->getFirst-s-VKNKU()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_2f

    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getLast-s-VKNKU()J

    move-result-wide v0

    invoke-virtual {p1}, Lkotlin/ranges/ULongRange;->getLast-s-VKNKU()J

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
    .registers 3

    .line 18
    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getEndExclusive-s-VKNKU()J

    move-result-wide v0

    invoke-static {v0, v1}, Lkotlin/ULong;->box-impl(J)Lkotlin/ULong;

    move-result-object p0

    return-object p0
.end method

.method public getEndExclusive-s-VKNKU()J
    .registers 5

    .line 27
    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getLast-s-VKNKU()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1a

    .line 28
    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getLast-s-VKNKU()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    invoke-static {v2, v3}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v2

    add-long/2addr v0, v2

    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v0

    return-wide v0

    .line 27
    :cond_1a
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Cannot return the exclusive upper bound of a range that includes MAX_VALUE."

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public bridge synthetic getEndInclusive()Ljava/lang/Comparable;
    .registers 3

    .line 18
    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getEndInclusive-s-VKNKU()J

    move-result-wide v0

    invoke-static {v0, v1}, Lkotlin/ULong;->box-impl(J)Lkotlin/ULong;

    move-result-object p0

    return-object p0
.end method

.method public getEndInclusive-s-VKNKU()J
    .registers 3

    .line 21
    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getLast-s-VKNKU()J

    move-result-wide v0

    return-wide v0
.end method

.method public bridge synthetic getStart()Ljava/lang/Comparable;
    .registers 3

    .line 18
    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getStart-s-VKNKU()J

    move-result-wide v0

    invoke-static {v0, v1}, Lkotlin/ULong;->box-impl(J)Lkotlin/ULong;

    move-result-object p0

    return-object p0
.end method

.method public getStart-s-VKNKU()J
    .registers 3

    .line 20
    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getFirst-s-VKNKU()J

    move-result-wide v0

    return-wide v0
.end method

.method public hashCode()I
    .registers 8

    .line 45
    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, -0x1

    return p0

    :cond_8
    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getFirst-s-VKNKU()J

    move-result-wide v0

    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getFirst-s-VKNKU()J

    move-result-wide v2

    const/16 v4, 0x20

    ushr-long/2addr v2, v4

    invoke-static {v2, v3}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v2

    xor-long/2addr v0, v2

    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v0

    long-to-int v0, v0

    mul-int/lit8 v0, v0, 0x1f

    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getLast-s-VKNKU()J

    move-result-wide v1

    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getLast-s-VKNKU()J

    move-result-wide v5

    ushr-long v3, v5, v4

    invoke-static {v3, v4}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v3

    xor-long/2addr v1, v3

    invoke-static {v1, v2}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v1

    long-to-int p0, v1

    add-int/2addr v0, p0

    return v0
.end method

.method public isEmpty()Z
    .registers 5

    .line 38
    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getFirst-s-VKNKU()J

    move-result-wide v0

    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getLast-s-VKNKU()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)I

    move-result p0

    if-lez p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getFirst-s-VKNKU()J

    move-result-wide v1

    invoke-static {v1, v2}, Lkotlin/ULong;->toString-impl(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ".."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lkotlin/ranges/ULongRange;->getLast-s-VKNKU()J

    move-result-wide v1

    invoke-static {v1, v2}, Lkotlin/ULong;->toString-impl(J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
