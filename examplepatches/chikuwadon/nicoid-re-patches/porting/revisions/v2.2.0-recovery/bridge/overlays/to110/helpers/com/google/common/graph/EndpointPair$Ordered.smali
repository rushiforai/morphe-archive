.class final Lcom/google/common/graph/EndpointPair$Ordered;
.super Lcom/google/common/graph/EndpointPair;
.source "EndpointPair.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/graph/EndpointPair;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Ordered"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/graph/EndpointPair<",
        "TN;>;"
    }
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "source",
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TN;TN;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 146
    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/graph/EndpointPair;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/common/graph/EndpointPair$1;)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/common/graph/EndpointPair$1;)V
    .registers 4

    .line 144
    invoke-direct {p0, p1, p2}, Lcom/google/common/graph/EndpointPair$Ordered;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obj"
        }
    .end annotation

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 169
    :cond_0
    instance-of v1, p1, Lcom/google/common/graph/EndpointPair;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 173
    :cond_1
    check-cast p1, Lcom/google/common/graph/EndpointPair;

    .line 174
    invoke-virtual {p0}, Lcom/google/common/graph/EndpointPair$Ordered;->isOrdered()Z

    move-result v1

    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->isOrdered()Z

    move-result v3

    if-eq v1, v3, :cond_2

    return v2

    .line 178
    :cond_2
    invoke-virtual {p0}, Lcom/google/common/graph/EndpointPair$Ordered;->source()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->source()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/google/common/graph/EndpointPair$Ordered;->target()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->target()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    return v0

    :cond_3
    return v2
.end method

.method public hashCode()I
    .registers 2

    .line 183
    invoke-virtual {p0}, Lcom/google/common/graph/EndpointPair$Ordered;->source()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/common/graph/EndpointPair$Ordered;->target()Ljava/lang/Object;

    move-result-object p0

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public isOrdered()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 1

    .line 144
    invoke-super {p0}, Lcom/google/common/graph/EndpointPair;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public source()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TN;"
        }
    .end annotation

    .line 151
    invoke-virtual {p0}, Lcom/google/common/graph/EndpointPair$Ordered;->nodeU()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public target()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TN;"
        }
    .end annotation

    .line 156
    invoke-virtual {p0}, Lcom/google/common/graph/EndpointPair$Ordered;->nodeV()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 188
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/common/graph/EndpointPair$Ordered;->source()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " -> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/common/graph/EndpointPair$Ordered;->target()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ">"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
