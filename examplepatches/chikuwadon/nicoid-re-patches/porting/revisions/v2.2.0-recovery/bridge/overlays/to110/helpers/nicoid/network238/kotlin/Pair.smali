.class public final Lnicoid/network238/kotlin/Pair;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private final first:Ljava/lang/Object;

.field private final second:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lnicoid/network238/kotlin/Pair;->first:Ljava/lang/Object;

    .line 28
    iput-object p2, p0, Lnicoid/network238/kotlin/Pair;->second:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final component1()Ljava/lang/Object;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/kotlin/Pair;->first:Ljava/lang/Object;

    return-object v0
.end method

.method public final component2()Ljava/lang/Object;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/kotlin/Pair;->second:Ljava/lang/Object;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lnicoid/network238/kotlin/Pair;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/kotlin/Pair;

    iget-object v0, p0, Lnicoid/network238/kotlin/Pair;->first:Ljava/lang/Object;

    iget-object v1, p1, Lnicoid/network238/kotlin/Pair;->first:Ljava/lang/Object;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/kotlin/Pair;->second:Ljava/lang/Object;

    iget-object p1, p1, Lnicoid/network238/kotlin/Pair;->second:Ljava/lang/Object;

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

.method public final getFirst()Ljava/lang/Object;
    .registers 2

    .line 27
    iget-object v0, p0, Lnicoid/network238/kotlin/Pair;->first:Ljava/lang/Object;

    return-object v0
.end method

.method public final getSecond()Ljava/lang/Object;
    .registers 2

    .line 28
    iget-object v0, p0, Lnicoid/network238/kotlin/Pair;->second:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    iget-object v0, p0, Lnicoid/network238/kotlin/Pair;->first:Ljava/lang/Object;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lnicoid/network238/kotlin/Pair;->second:Ljava/lang/Object;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_1
    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/kotlin/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/kotlin/Pair;->second:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
