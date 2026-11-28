.class final Lnicoid/network238/kotlin/collections/EmptyMap;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Map;
.implements Ljava/io/Serializable;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# static fields
.field public static final INSTANCE:Lnicoid/network238/kotlin/collections/EmptyMap;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/kotlin/collections/EmptyMap;

    invoke-direct {v0}, Lnicoid/network238/kotlin/collections/EmptyMap;-><init>()V

    sput-object v0, Lnicoid/network238/kotlin/collections/EmptyMap;->INSTANCE:Lnicoid/network238/kotlin/collections/EmptyMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 3

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation is not supported for read-only collection"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method public final bridge containsValue(Ljava/lang/Object;)Z
    .registers 3

    .line 14
    instance-of v0, p1, Ljava/lang/Void;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/collections/EmptyMap;->containsValue(Ljava/lang/Void;)Z

    move-result p1

    return p1
.end method

.method public containsValue(Ljava/lang/Void;)Z
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p1, 0x0

    return p1
.end method

.method public final bridge entrySet()Ljava/util/Set;
    .registers 2

    .line 14
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/EmptyMap;->getEntries()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3

    .line 17
    instance-of v0, p1, Ljava/util/Map;

    if-eqz v0, :cond_0

    check-cast p1, Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 14
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/collections/EmptyMap;->get(Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Void;
    .registers 2

    const/4 p1, 0x0

    return-object p1
.end method

.method public getEntries()Ljava/util/Set;
    .registers 2

    .line 27
    sget-object v0, Lnicoid/network238/kotlin/collections/EmptySet;->INSTANCE:Lnicoid/network238/kotlin/collections/EmptySet;

    return-object v0
.end method

.method public getKeys()Ljava/util/Set;
    .registers 2

    .line 28
    sget-object v0, Lnicoid/network238/kotlin/collections/EmptySet;->INSTANCE:Lnicoid/network238/kotlin/collections/EmptySet;

    return-object v0
.end method

.method public getSize()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public getValues()Ljava/util/Collection;
    .registers 2

    .line 29
    sget-object v0, Lnicoid/network238/kotlin/collections/EmptyList;->INSTANCE:Lnicoid/network238/kotlin/collections/EmptyList;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public final bridge keySet()Ljava/util/Set;
    .registers 2

    .line 14
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/EmptyMap;->getKeys()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Operation is not supported for read-only collection"

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public putAll(Ljava/util/Map;)V
    .registers 3

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 14
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/collections/EmptyMap;->remove(Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Void;
    .registers 3

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final bridge size()I
    .registers 2

    .line 14
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/EmptyMap;->getSize()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 19
    const-string v0, "{}"

    return-object v0
.end method

.method public final bridge values()Ljava/util/Collection;
    .registers 2

    .line 14
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/EmptyMap;->getValues()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
