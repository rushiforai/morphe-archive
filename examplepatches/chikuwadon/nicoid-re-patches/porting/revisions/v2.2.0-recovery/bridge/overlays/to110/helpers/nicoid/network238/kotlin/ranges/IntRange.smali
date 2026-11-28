.class public final Lnicoid/network238/kotlin/ranges/IntRange;
.super Lnicoid/network238/kotlin/ranges/IntProgression;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/ranges/ClosedRange;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/ranges/IntRange$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/kotlin/ranges/IntRange$Companion;

.field private static final EMPTY:Lnicoid/network238/kotlin/ranges/IntRange;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lnicoid/network238/kotlin/ranges/IntRange$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/ranges/IntRange$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/kotlin/ranges/IntRange;->Companion:Lnicoid/network238/kotlin/ranges/IntRange$Companion;

    .line 85
    new-instance v0, Lnicoid/network238/kotlin/ranges/IntRange;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lnicoid/network238/kotlin/ranges/IntRange;-><init>(II)V

    sput-object v0, Lnicoid/network238/kotlin/ranges/IntRange;->EMPTY:Lnicoid/network238/kotlin/ranges/IntRange;

    return-void
.end method

.method public constructor <init>(II)V
    .registers 4

    .line 53
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lnicoid/network238/kotlin/ranges/IntProgression;-><init>(III)V

    return-void
.end method

.method public static final synthetic access$getEMPTY$cp()Lnicoid/network238/kotlin/ranges/IntRange;
    .registers 1

    .line 53
    sget-object v0, Lnicoid/network238/kotlin/ranges/IntRange;->EMPTY:Lnicoid/network238/kotlin/ranges/IntRange;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .line 75
    instance-of v0, p1, Lnicoid/network238/kotlin/ranges/IntRange;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntRange;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lnicoid/network238/kotlin/ranges/IntRange;

    invoke-virtual {v0}, Lnicoid/network238/kotlin/ranges/IntRange;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 76
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getFirst()I

    move-result v0

    check-cast p1, Lnicoid/network238/kotlin/ranges/IntRange;

    invoke-virtual {p1}, Lnicoid/network238/kotlin/ranges/IntProgression;->getFirst()I

    move-result v1

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getLast()I

    move-result v0

    invoke-virtual {p1}, Lnicoid/network238/kotlin/ranges/IntProgression;->getLast()I

    move-result p1

    if-ne v0, p1, :cond_1

    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic getEndInclusive()Ljava/lang/Comparable;
    .registers 2

    .line 53
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntRange;->getEndInclusive()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getEndInclusive()Ljava/lang/Integer;
    .registers 2

    .line 55
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getLast()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getStart()Ljava/lang/Comparable;
    .registers 2

    .line 53
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntRange;->getStart()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getStart()Ljava/lang/Integer;
    .registers 2

    .line 54
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getFirst()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .line 79
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntRange;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getFirst()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getLast()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isEmpty()Z
    .registers 3

    .line 72
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getFirst()I

    move-result v0

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getLast()I

    move-result v1

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getFirst()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getLast()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
