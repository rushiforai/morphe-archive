.class public Lorg/eclipse/jetty/server/ResourceCache$Content;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/http/HttpContent;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/ResourceCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Content"
.end annotation


# instance fields
.field final _contentType:Lorg/eclipse/jetty/io/Buffer;

.field _directBuffer:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lorg/eclipse/jetty/io/Buffer;",
            ">;"
        }
    .end annotation
.end field

.field _indirectBuffer:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lorg/eclipse/jetty/io/Buffer;",
            ">;"
        }
    .end annotation
.end field

.field final _key:Ljava/lang/String;

.field volatile _lastAccessed:J

.field final _lastModified:J

.field final _lastModifiedBytes:Lorg/eclipse/jetty/io/Buffer;

.field final _length:I

.field final _resource:Lorg/eclipse/jetty/util/resource/Resource;

.field final synthetic this$0:Lorg/eclipse/jetty/server/ResourceCache;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/ResourceCache;Ljava/lang/String;Lorg/eclipse/jetty/util/resource/Resource;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->this$0:Lorg/eclipse/jetty/server/ResourceCache;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_indirectBuffer:Ljava/util/concurrent/atomic/AtomicReference;

    .line 12
    .line 13
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_directBuffer:Ljava/util/concurrent/atomic/AtomicReference;

    .line 19
    .line 20
    iput-object p2, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_key:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p3, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 23
    .line 24
    invoke-static {p1}, Lorg/eclipse/jetty/server/ResourceCache;->access$000(Lorg/eclipse/jetty/server/ResourceCache;)Lorg/eclipse/jetty/http/MimeTypes;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p2, v0}, Lorg/eclipse/jetty/http/MimeTypes;->getMimeByExtension(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iput-object p2, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_contentType:Lorg/eclipse/jetty/io/Buffer;

    .line 37
    .line 38
    invoke-virtual {p3}, Lorg/eclipse/jetty/util/resource/Resource;->exists()Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    if-eqz p2, :cond_0

    .line 43
    .line 44
    invoke-virtual {p3}, Lorg/eclipse/jetty/util/resource/Resource;->lastModified()J

    .line 45
    .line 46
    .line 47
    move-result-wide v0

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const-wide/16 v0, -0x1

    .line 50
    .line 51
    :goto_0
    iput-wide v0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_lastModified:J

    .line 52
    .line 53
    const-wide/16 v2, 0x0

    .line 54
    .line 55
    cmp-long v2, v0, v2

    .line 56
    .line 57
    if-gez v2, :cond_1

    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    goto :goto_1

    .line 61
    :cond_1
    new-instance v2, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 62
    .line 63
    invoke-static {v0, v1}, Lorg/eclipse/jetty/http/HttpFields;->formatDate(J)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-direct {v2, v0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    move-object v0, v2

    .line 71
    :goto_1
    iput-object v0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_lastModifiedBytes:Lorg/eclipse/jetty/io/Buffer;

    .line 72
    .line 73
    if-eqz p2, :cond_2

    .line 74
    .line 75
    invoke-virtual {p3}, Lorg/eclipse/jetty/util/resource/Resource;->length()J

    .line 76
    .line 77
    .line 78
    move-result-wide p2

    .line 79
    long-to-int p2, p2

    .line 80
    goto :goto_2

    .line 81
    :cond_2
    const/4 p2, 0x0

    .line 82
    :goto_2
    iput p2, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_length:I

    .line 83
    .line 84
    invoke-static {p1}, Lorg/eclipse/jetty/server/ResourceCache;->access$100(Lorg/eclipse/jetty/server/ResourceCache;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 85
    .line 86
    .line 87
    move-result-object p3

    .line 88
    invoke-virtual {p3, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    .line 89
    .line 90
    .line 91
    invoke-static {p1}, Lorg/eclipse/jetty/server/ResourceCache;->access$200(Lorg/eclipse/jetty/server/ResourceCache;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 96
    .line 97
    .line 98
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 99
    .line 100
    .line 101
    move-result-wide p1

    .line 102
    iput-wide p1, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_lastAccessed:J

    .line 103
    .line 104
    return-void
.end method


# virtual methods
.method public getContentLength()J
    .locals 2

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_length:I

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    return-wide v0
.end method

.method public getContentType()Lorg/eclipse/jetty/io/Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_contentType:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDirectBuffer()Lorg/eclipse/jetty/io/Buffer;
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_directBuffer:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lorg/eclipse/jetty/io/Buffer;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    iget-object v2, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->this$0:Lorg/eclipse/jetty/server/ResourceCache;

    .line 13
    .line 14
    iget-object v3, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Lorg/eclipse/jetty/server/ResourceCache;->getDirectBuffer(Lorg/eclipse/jetty/util/resource/Resource;)Lorg/eclipse/jetty/io/Buffer;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    invoke-static {}, Lorg/eclipse/jetty/server/ResourceCache;->access$400()Lorg/eclipse/jetty/util/log/Logger;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    new-instance v3, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v4, "Could not load "

    .line 29
    .line 30
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const/4 v3, 0x0

    .line 41
    new-array v3, v3, [Ljava/lang/Object;

    .line 42
    .line 43
    invoke-interface {v2, p0, v3}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_directBuffer:Ljava/util/concurrent/atomic/AtomicReference;

    .line 48
    .line 49
    invoke-static {v0, v1, v2}, Ll/m31;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    move-object v0, v2

    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iget-object p0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_directBuffer:Ljava/util/concurrent/atomic/AtomicReference;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    move-object v0, p0

    .line 64
    check-cast v0, Lorg/eclipse/jetty/io/Buffer;

    .line 65
    .line 66
    :cond_2
    :goto_0
    if-nez v0, :cond_3

    .line 67
    .line 68
    return-object v1

    .line 69
    :cond_3
    new-instance p0, Lorg/eclipse/jetty/io/View;

    .line 70
    .line 71
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/io/View;-><init>(Lorg/eclipse/jetty/io/Buffer;)V

    .line 72
    .line 73
    .line 74
    return-object p0
.end method

.method public getIndirectBuffer()Lorg/eclipse/jetty/io/Buffer;
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_indirectBuffer:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lorg/eclipse/jetty/io/Buffer;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    iget-object v2, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->this$0:Lorg/eclipse/jetty/server/ResourceCache;

    .line 13
    .line 14
    iget-object v3, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Lorg/eclipse/jetty/server/ResourceCache;->getIndirectBuffer(Lorg/eclipse/jetty/util/resource/Resource;)Lorg/eclipse/jetty/io/Buffer;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    invoke-static {}, Lorg/eclipse/jetty/server/ResourceCache;->access$400()Lorg/eclipse/jetty/util/log/Logger;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    new-instance v3, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v4, "Could not load "

    .line 29
    .line 30
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const/4 v3, 0x0

    .line 41
    new-array v3, v3, [Ljava/lang/Object;

    .line 42
    .line 43
    invoke-interface {v2, p0, v3}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_indirectBuffer:Ljava/util/concurrent/atomic/AtomicReference;

    .line 48
    .line 49
    invoke-static {v0, v1, v2}, Ll/m31;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    move-object v0, v2

    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iget-object p0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_indirectBuffer:Ljava/util/concurrent/atomic/AtomicReference;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    move-object v0, p0

    .line 64
    check-cast v0, Lorg/eclipse/jetty/io/Buffer;

    .line 65
    .line 66
    :cond_2
    :goto_0
    if-nez v0, :cond_3

    .line 67
    .line 68
    return-object v1

    .line 69
    :cond_3
    new-instance p0, Lorg/eclipse/jetty/io/View;

    .line 70
    .line 71
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/io/View;-><init>(Lorg/eclipse/jetty/io/Buffer;)V

    .line 72
    .line 73
    .line 74
    return-object p0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/ResourceCache$Content;->getIndirectBuffer()Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    new-instance p0, Ljava/io/ByteArrayInputStream;

    .line 14
    .line 15
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-direct {p0, v1, v2, v0}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    .line 28
    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 32
    .line 33
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/resource/Resource;->getInputStream()Ljava/io/InputStream;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public getKey()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_key:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLastModified()Lorg/eclipse/jetty/io/Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_lastModifiedBytes:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResource()Lorg/eclipse/jetty/util/resource/Resource;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 2
    .line 3
    return-object p0
.end method

.method public invalidate()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->this$0:Lorg/eclipse/jetty/server/ResourceCache;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/server/ResourceCache;->access$100(Lorg/eclipse/jetty/server/ResourceCache;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_length:I

    .line 8
    .line 9
    neg-int v1, v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->this$0:Lorg/eclipse/jetty/server/ResourceCache;

    .line 14
    .line 15
    invoke-static {v0}, Lorg/eclipse/jetty/server/ResourceCache;->access$200(Lorg/eclipse/jetty/server/ResourceCache;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 23
    .line 24
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/resource/Resource;->release()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public isCached()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_key:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isMiss()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isValid()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_lastModified:J

    .line 2
    .line 3
    iget-object v2, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 4
    .line 5
    invoke-virtual {v2}, Lorg/eclipse/jetty/util/resource/Resource;->lastModified()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    cmp-long v0, v0, v2

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iput-wide v0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_lastAccessed:J

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->this$0:Lorg/eclipse/jetty/server/ResourceCache;

    .line 22
    .line 23
    invoke-static {v0}, Lorg/eclipse/jetty/server/ResourceCache;->access$300(Lorg/eclipse/jetty/server/ResourceCache;)Ljava/util/concurrent/ConcurrentMap;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_key:Ljava/lang/String;

    .line 28
    .line 29
    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-ne p0, v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/ResourceCache$Content;->invalidate()V

    .line 36
    .line 37
    .line 38
    :cond_1
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method public release()V
    .locals 0

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/resource/Resource;->exists()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_resource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 12
    .line 13
    invoke-virtual {v2}, Lorg/eclipse/jetty/util/resource/Resource;->lastModified()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_contentType:Lorg/eclipse/jetty/io/Buffer;

    .line 22
    .line 23
    iget-object p0, p0, Lorg/eclipse/jetty/server/ResourceCache$Content;->_lastModifiedBytes:Lorg/eclipse/jetty/io/Buffer;

    .line 24
    .line 25
    filled-new-array {v0, v1, v2, v3, p0}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "%s %s %d %s %s"

    .line 30
    .line 31
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method
