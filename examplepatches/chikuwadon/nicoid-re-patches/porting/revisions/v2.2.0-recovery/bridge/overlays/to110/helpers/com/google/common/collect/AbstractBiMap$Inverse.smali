.class final Lcom/google/common/collect/AbstractBiMap$Inverse;
.super Lcom/google/common/collect/AbstractBiMap;
.source "AbstractBiMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/AbstractBiMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Inverse"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/AbstractBiMap<",
        "TK;TV;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J


# direct methods
.method constructor <init>(Ljava/util/Map;Lcom/google/common/collect/AbstractBiMap;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "backward",
            "forward"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "TK;TV;>;",
            "Lcom/google/common/collect/AbstractBiMap<",
            "TV;TK;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 429
    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/collect/AbstractBiMap;-><init>(Ljava/util/Map;Lcom/google/common/collect/AbstractBiMap;Lcom/google/common/collect/AbstractBiMap$1;)V

    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stream"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 467
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 468
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/collect/AbstractBiMap;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/AbstractBiMap$Inverse;->setInverse(Lcom/google/common/collect/AbstractBiMap;)V

    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stream"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 459
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 460
    invoke-virtual {p0}, Lcom/google/common/collect/AbstractBiMap$Inverse;->inverse()Lcom/google/common/collect/BiMap;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method checkKey(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TK;"
        }
    .end annotation

    .line 444
    # getter for: Lcom/google/common/collect/AbstractBiMap;->inverse:Lcom/google/common/collect/AbstractBiMap;
    invoke-static {p0}, Lcom/google/common/collect/AbstractBiMap;->access$400(Lcom/google/common/collect/AbstractBiMap;)Lcom/google/common/collect/AbstractBiMap;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/google/common/collect/AbstractBiMap;->checkValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method checkValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)TV;"
        }
    .end annotation

    .line 450
    # getter for: Lcom/google/common/collect/AbstractBiMap;->inverse:Lcom/google/common/collect/AbstractBiMap;
    invoke-static {p0}, Lcom/google/common/collect/AbstractBiMap;->access$400(Lcom/google/common/collect/AbstractBiMap;)Lcom/google/common/collect/AbstractBiMap;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/google/common/collect/AbstractBiMap;->checkKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 426
    invoke-super {p0}, Lcom/google/common/collect/AbstractBiMap;->delegate()Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method readResolve()Ljava/lang/Object;
    .registers 1

    .line 474
    invoke-virtual {p0}, Lcom/google/common/collect/AbstractBiMap$Inverse;->inverse()Lcom/google/common/collect/BiMap;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/BiMap;->inverse()Lcom/google/common/collect/BiMap;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic values()Ljava/util/Collection;
    .registers 1

    .line 426
    invoke-super {p0}, Lcom/google/common/collect/AbstractBiMap;->values()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method
