.class public final Lcom/google/common/collect/ArrayListMultimap;
.super Lcom/google/common/collect/AbstractListMultimap;
.source "ArrayListMultimap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/AbstractListMultimap<",
        "TK;TV;>;"
    }
.end annotation


# static fields
.field private static final DEFAULT_VALUES_PER_KEY:I = 0x3

.field private static final serialVersionUID:J


# instance fields
.field transient expectedValuesPerKey:I


# direct methods
.method private constructor <init>()V
    .registers 3

    const/16 v0, 0xc

    const/4 v1, 0x3

    .line 115
    invoke-direct {p0, v0, v1}, Lcom/google/common/collect/ArrayListMultimap;-><init>(II)V

    return-void
.end method

.method private constructor <init>(II)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "expectedKeys",
            "expectedValuesPerKey"
        }
    .end annotation

    .line 119
    invoke-static {p1}, Lcom/google/common/collect/Platform;->newHashMapWithExpectedSize(I)Ljava/util/Map;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/common/collect/AbstractListMultimap;-><init>(Ljava/util/Map;)V

    .line 120
    const-string p1, "expectedValuesPerKey"

    invoke-static {p2, p1}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    .line 121
    iput p2, p0, Lcom/google/common/collect/ArrayListMultimap;->expectedValuesPerKey:I

    return-void
.end method

.method private constructor <init>(Lcom/google/common/collect/Multimap;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "multimap"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Multimap<",
            "+TK;+TV;>;)V"
        }
    .end annotation

    .line 126
    invoke-interface {p1}, Lcom/google/common/collect/Multimap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    .line 127
    instance-of v1, p1, Lcom/google/common/collect/ArrayListMultimap;

    if-eqz v1, :cond_0

    .line 128
    move-object v1, p1

    check-cast v1, Lcom/google/common/collect/ArrayListMultimap;

    iget v1, v1, Lcom/google/common/collect/ArrayListMultimap;->expectedValuesPerKey:I

    goto :goto_0

    :cond_0
    const/4 v1, 0x3

    .line 125
    :goto_0
    invoke-direct {p0, v0, v1}, Lcom/google/common/collect/ArrayListMultimap;-><init>(II)V

    .line 130
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ArrayListMultimap;->putAll(Lcom/google/common/collect/Multimap;)Z

    return-void
.end method

.method public static create()Lcom/google/common/collect/ArrayListMultimap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/google/common/collect/ArrayListMultimap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 79
    new-instance v0, Lcom/google/common/collect/ArrayListMultimap;

    invoke-direct {v0}, Lcom/google/common/collect/ArrayListMultimap;-><init>()V

    return-object v0
.end method

.method public static create(II)Lcom/google/common/collect/ArrayListMultimap;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "expectedKeys",
            "expectedValuesPerKey"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(II)",
            "Lcom/google/common/collect/ArrayListMultimap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 97
    new-instance v0, Lcom/google/common/collect/ArrayListMultimap;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/ArrayListMultimap;-><init>(II)V

    return-object v0
.end method

.method public static create(Lcom/google/common/collect/Multimap;)Lcom/google/common/collect/ArrayListMultimap;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "multimap"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/Multimap<",
            "+TK;+TV;>;)",
            "Lcom/google/common/collect/ArrayListMultimap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 111
    new-instance v0, Lcom/google/common/collect/ArrayListMultimap;

    invoke-direct {v0, p0}, Lcom/google/common/collect/ArrayListMultimap;-><init>(Lcom/google/common/collect/Multimap;)V

    return-object v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 4
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

    .line 170
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    const/4 v0, 0x3

    .line 171
    iput v0, p0, Lcom/google/common/collect/ArrayListMultimap;->expectedValuesPerKey:I

    .line 172
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    .line 173
    invoke-static {}, Lcom/google/common/collect/CompactHashMap;->create()Lcom/google/common/collect/CompactHashMap;

    move-result-object v1

    .line 174
    invoke-virtual {p0, v1}, Lcom/google/common/collect/ArrayListMultimap;->setMap(Ljava/util/Map;)V

    .line 175
    invoke-static {p0, p1, v0}, Lcom/google/common/collect/Serialization;->populateMultimap(Lcom/google/common/collect/Multimap;Ljava/io/ObjectInputStream;I)V

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

    .line 163
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 164
    invoke-static {p0, p1}, Lcom/google/common/collect/Serialization;->writeMultimap(Lcom/google/common/collect/Multimap;Ljava/io/ObjectOutputStream;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic asMap()Ljava/util/Map;
    .registers 1

    .line 62
    invoke-super {p0}, Lcom/google/common/collect/AbstractListMultimap;->asMap()Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic containsEntry(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "key",
            "value"
        }
    .end annotation

    .line 62
    invoke-super {p0, p1, p2}, Lcom/google/common/collect/AbstractListMultimap;->containsEntry(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public bridge synthetic containsValue(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "value"
        }
    .end annotation

    .line 62
    invoke-super {p0, p1}, Lcom/google/common/collect/AbstractListMultimap;->containsValue(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method bridge synthetic createCollection()Ljava/util/Collection;
    .registers 1

    .line 62
    invoke-virtual {p0}, Lcom/google/common/collect/ArrayListMultimap;->createCollection()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method createCollection()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TV;>;"
        }
    .end annotation

    .line 138
    new-instance v0, Ljava/util/ArrayList;

    iget p0, p0, Lcom/google/common/collect/ArrayListMultimap;->expectedValuesPerKey:I

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(I)V

    return-object v0
.end method

.method public bridge synthetic entries()Ljava/util/Collection;
    .registers 1

    .line 62
    invoke-super {p0}, Lcom/google/common/collect/AbstractListMultimap;->entries()Ljava/util/Collection;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic hashCode()I
    .registers 1

    .line 62
    invoke-super {p0}, Lcom/google/common/collect/AbstractListMultimap;->hashCode()I

    move-result p0

    return p0
.end method

.method public bridge synthetic isEmpty()Z
    .registers 1

    .line 62
    invoke-super {p0}, Lcom/google/common/collect/AbstractListMultimap;->isEmpty()Z

    move-result p0

    return p0
.end method

.method public bridge synthetic keySet()Ljava/util/Set;
    .registers 1

    .line 62
    invoke-super {p0}, Lcom/google/common/collect/AbstractListMultimap;->keySet()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic keys()Lcom/google/common/collect/Multiset;
    .registers 1

    .line 62
    invoke-super {p0}, Lcom/google/common/collect/AbstractListMultimap;->keys()Lcom/google/common/collect/Multiset;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic putAll(Lcom/google/common/collect/Multimap;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "multimap"
        }
    .end annotation

    .line 62
    invoke-super {p0, p1}, Lcom/google/common/collect/AbstractListMultimap;->putAll(Lcom/google/common/collect/Multimap;)Z

    move-result p0

    return p0
.end method

.method public bridge synthetic putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "key",
            "values"
        }
    .end annotation

    .line 62
    invoke-super {p0, p1, p2}, Lcom/google/common/collect/AbstractListMultimap;->putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Z

    move-result p0

    return p0
.end method

.method public bridge synthetic remove(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "key",
            "value"
        }
    .end annotation

    .line 62
    invoke-super {p0, p1, p2}, Lcom/google/common/collect/AbstractListMultimap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public trimToSize()V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 150
    invoke-virtual {p0}, Lcom/google/common/collect/ArrayListMultimap;->backingMap()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    .line 151
    check-cast v0, Ljava/util/ArrayList;

    .line 152
    invoke-virtual {v0}, Ljava/util/ArrayList;->trimToSize()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public bridge synthetic values()Ljava/util/Collection;
    .registers 1

    .line 62
    invoke-super {p0}, Lcom/google/common/collect/AbstractListMultimap;->values()Ljava/util/Collection;

    move-result-object p0

    return-object p0
.end method
