.class public final Lnicoid/network238/kotlin/ranges/LongRange;
.super Lnicoid/network238/kotlin/ranges/LongProgression;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/ranges/ClosedRange;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/ranges/LongRange$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/kotlin/ranges/LongRange$Companion;

.field private static final EMPTY:Lnicoid/network238/kotlin/ranges/LongRange;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lnicoid/network238/kotlin/ranges/LongRange$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/ranges/LongRange$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/kotlin/ranges/LongRange;->Companion:Lnicoid/network238/kotlin/ranges/LongRange$Companion;

    .line 124
    new-instance v0, Lnicoid/network238/kotlin/ranges/LongRange;

    const-wide/16 v1, 0x1

    const-wide/16 v3, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lnicoid/network238/kotlin/ranges/LongRange;-><init>(JJ)V

    sput-object v0, Lnicoid/network238/kotlin/ranges/LongRange;->EMPTY:Lnicoid/network238/kotlin/ranges/LongRange;

    return-void
.end method

.method public constructor <init>(JJ)V
    .registers 12

    .line 92
    const-wide/16 v5, 0x1

    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    invoke-direct/range {v0 .. v6}, Lnicoid/network238/kotlin/ranges/LongProgression;-><init>(JJJ)V

    return-void
.end method

.method public static final synthetic access$getEMPTY$cp()Lnicoid/network238/kotlin/ranges/LongRange;
    .registers 1

    .line 92
    sget-object v0, Lnicoid/network238/kotlin/ranges/LongRange;->EMPTY:Lnicoid/network238/kotlin/ranges/LongRange;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    .line 114
    instance-of v0, p1, Lnicoid/network238/kotlin/ranges/LongRange;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongRange;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lnicoid/network238/kotlin/ranges/LongRange;

    invoke-virtual {v0}, Lnicoid/network238/kotlin/ranges/LongRange;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 115
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->getFirst()J

    move-result-wide v0

    check-cast p1, Lnicoid/network238/kotlin/ranges/LongRange;

    invoke-virtual {p1}, Lnicoid/network238/kotlin/ranges/LongProgression;->getFirst()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->getLast()J

    move-result-wide v0

    invoke-virtual {p1}, Lnicoid/network238/kotlin/ranges/LongProgression;->getLast()J

    move-result-wide v2

    cmp-long p1, v0, v2

    if-nez p1, :cond_1

    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic getEndInclusive()Ljava/lang/Comparable;
    .registers 2

    .line 92
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongRange;->getEndInclusive()Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public getEndInclusive()Ljava/lang/Long;
    .registers 3

    .line 94
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->getLast()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getStart()Ljava/lang/Comparable;
    .registers 2

    .line 92
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongRange;->getStart()Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public getStart()Ljava/lang/Long;
    .registers 3

    .line 93
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->getFirst()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 8

    .line 118
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongRange;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->getFirst()J

    move-result-wide v0

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->getFirst()J

    move-result-wide v2

    const/16 v4, 0x20

    ushr-long/2addr v2, v4

    xor-long/2addr v0, v2

    const-wide/16 v2, 0x1f

    mul-long/2addr v0, v2

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->getLast()J

    move-result-wide v2

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->getLast()J

    move-result-wide v5

    ushr-long/2addr v5, v4

    xor-long/2addr v2, v5

    add-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public isEmpty()Z
    .registers 5

    .line 111
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->getFirst()J

    move-result-wide v0

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->getLast()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->getFirst()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->getLast()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
