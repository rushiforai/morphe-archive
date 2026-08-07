.class public Lorg/eclipse/jetty/io/BufferCache;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;
    }
.end annotation


# instance fields
.field private final _bufferMap:Ljava/util/HashMap;

.field private final _index:Ljava/util/ArrayList;

.field private final _stringMap:Lorg/eclipse/jetty/util/StringMap;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/io/BufferCache;->_bufferMap:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Lorg/eclipse/jetty/util/StringMap;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-direct {v0, v1}, Lorg/eclipse/jetty/util/StringMap;-><init>(Z)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lorg/eclipse/jetty/io/BufferCache;->_stringMap:Lorg/eclipse/jetty/util/StringMap;

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lorg/eclipse/jetty/io/BufferCache;->_index:Ljava/util/ArrayList;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;
    .locals 2

    .line 1
    new-instance v0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;-><init>(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/eclipse/jetty/io/BufferCache;->_bufferMap:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v1, v0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lorg/eclipse/jetty/io/BufferCache;->_stringMap:Lorg/eclipse/jetty/util/StringMap;

    .line 12
    .line 13
    invoke-virtual {v1, p1, v0}, Lorg/eclipse/jetty/util/StringMap;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    :goto_0
    iget-object p1, p0, Lorg/eclipse/jetty/io/BufferCache;->_index:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    sub-int p1, p2, p1

    .line 23
    .line 24
    iget-object v1, p0, Lorg/eclipse/jetty/io/BufferCache;->_index:Ljava/util/ArrayList;

    .line 25
    .line 26
    if-ltz p1, :cond_0

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lorg/eclipse/jetty/io/BufferCache;->_index:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {p0, p2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-object v0
.end method

.method public get(I)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;
    .locals 1

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lorg/eclipse/jetty/io/BufferCache;->_index:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lt p1, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/io/BufferCache;->_index:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public get(Ljava/lang/String;)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;
    .locals 0

    .line 24
    iget-object p0, p0, Lorg/eclipse/jetty/io/BufferCache;->_stringMap:Lorg/eclipse/jetty/util/StringMap;

    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/StringMap;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    return-object p0
.end method

.method public get(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;
    .locals 0

    .line 23
    iget-object p0, p0, Lorg/eclipse/jetty/io/BufferCache;->_bufferMap:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    return-object p0
.end method

.method public getBest([BII)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/BufferCache;->_stringMap:Lorg/eclipse/jetty/util/StringMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jetty/util/StringMap;->getBestEntry([BII)Ljava/util/Map$Entry;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public getOrdinal(Ljava/lang/String;)I
    .locals 0

    .line 31
    iget-object p0, p0, Lorg/eclipse/jetty/io/BufferCache;->_stringMap:Lorg/eclipse/jetty/util/StringMap;

    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/StringMap;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    if-nez p0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 32
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->getOrdinal()I

    move-result p0

    return p0
.end method

.method public getOrdinal(Lorg/eclipse/jetty/io/Buffer;)I
    .locals 1

    .line 1
    instance-of v0, p1, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 6
    .line 7
    invoke-virtual {p1}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->getOrdinal()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    instance-of p1, p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    check-cast p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 23
    .line 24
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->getOrdinal()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_1
    const/4 p0, -0x1

    .line 30
    return p0
.end method

.method public lookup(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;
    .locals 1

    .line 32
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/BufferCache;->get(Ljava/lang/String;)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    move-result-object p0

    if-nez p0, :cond_0

    .line 33
    new-instance p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;-><init>(Ljava/lang/String;I)V

    :cond_0
    return-object p0
.end method

.method public lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;
    .locals 2

    .line 1
    instance-of v0, p1, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object p1

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/BufferCache;->get(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-nez p0, :cond_2

    .line 11
    .line 12
    instance-of p0, p1, Lorg/eclipse/jetty/io/Buffer$CaseInsensitve;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    return-object p1

    .line 17
    :cond_1
    new-instance p0, Lorg/eclipse/jetty/io/ByteArrayBuffer$CaseInsensitive;

    .line 18
    .line 19
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->asArray()[B

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-direct {p0, v0, v1, p1, v1}, Lorg/eclipse/jetty/io/ByteArrayBuffer$CaseInsensitive;-><init>([BIII)V

    .line 29
    .line 30
    .line 31
    :cond_2
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "CACHE[bufferMap="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lorg/eclipse/jetty/io/BufferCache;->_bufferMap:Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ",stringMap="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lorg/eclipse/jetty/io/BufferCache;->_stringMap:Lorg/eclipse/jetty/util/StringMap;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ",index="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lorg/eclipse/jetty/io/BufferCache;->_index:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p0, "]"

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public toString(Lorg/eclipse/jetty/io/Buffer;)Ljava/lang/String;
    .locals 0

    .line 43
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
