.class public final Lnicoid/network238/kotlin/text/MatchGroup;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final range:Lnicoid/network238/kotlin/ranges/IntRange;

.field private final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lnicoid/network238/kotlin/ranges/IntRange;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/kotlin/text/MatchGroup;->value:Ljava/lang/String;

    iput-object p2, p0, Lnicoid/network238/kotlin/text/MatchGroup;->range:Lnicoid/network238/kotlin/ranges/IntRange;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lnicoid/network238/kotlin/text/MatchGroup;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/kotlin/text/MatchGroup;

    iget-object v0, p0, Lnicoid/network238/kotlin/text/MatchGroup;->value:Ljava/lang/String;

    iget-object v1, p1, Lnicoid/network238/kotlin/text/MatchGroup;->value:Ljava/lang/String;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/kotlin/text/MatchGroup;->range:Lnicoid/network238/kotlin/ranges/IntRange;

    iget-object p1, p1, Lnicoid/network238/kotlin/text/MatchGroup;->range:Lnicoid/network238/kotlin/ranges/IntRange;

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public final getValue()Ljava/lang/String;
    .registers 2

    .line 73
    iget-object v0, p0, Lnicoid/network238/kotlin/text/MatchGroup;->value:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    iget-object v0, p0, Lnicoid/network238/kotlin/text/MatchGroup;->value:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/kotlin/text/MatchGroup;->range:Lnicoid/network238/kotlin/ranges/IntRange;

    invoke-virtual {v1}, Lnicoid/network238/kotlin/ranges/IntRange;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "MatchGroup(value="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/kotlin/text/MatchGroup;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", range="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/kotlin/text/MatchGroup;->range:Lnicoid/network238/kotlin/ranges/IntRange;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
