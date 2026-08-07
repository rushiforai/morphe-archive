.class public Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;
.super Lorg/eclipse/jetty/io/ByteArrayBuffer$CaseInsensitive;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/io/BufferCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CachedBuffer"
.end annotation


# instance fields
.field private _associateMap:Ljava/util/HashMap;

.field private final _ordinal:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/io/ByteArrayBuffer$CaseInsensitive;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->_associateMap:Ljava/util/HashMap;

    .line 6
    .line 7
    iput p2, p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->_ordinal:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public getAssociate(Ljava/lang/Object;)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->_associateMap:Ljava/util/HashMap;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 12
    .line 13
    return-object p0
.end method

.method public getOrdinal()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->_ordinal:I

    .line 2
    .line 3
    return p0
.end method

.method public setAssociate(Ljava/lang/Object;Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->_associateMap:Ljava/util/HashMap;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->_associateMap:Ljava/util/HashMap;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->_associateMap:Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    return-void
.end method
