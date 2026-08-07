.class public abstract Lorg/eclipse/jetty/io/AbstractBuffers;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/io/Buffers;


# instance fields
.field protected final _bufferSize:I

.field protected final _bufferType:Lorg/eclipse/jetty/io/Buffers$Type;

.field protected final _headerSize:I

.field protected final _headerType:Lorg/eclipse/jetty/io/Buffers$Type;

.field protected final _otherType:Lorg/eclipse/jetty/io/Buffers$Type;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/io/Buffers$Type;ILorg/eclipse/jetty/io/Buffers$Type;ILorg/eclipse/jetty/io/Buffers$Type;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_headerType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 5
    .line 6
    iput p2, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_headerSize:I

    .line 7
    .line 8
    iput-object p3, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_bufferType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 9
    .line 10
    iput p4, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_bufferSize:I

    .line 11
    .line 12
    iput-object p5, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_otherType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getBufferSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_bufferSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getHeaderSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_headerSize:I

    .line 2
    .line 3
    return p0
.end method

.method public final isBuffer(Lorg/eclipse/jetty/io/Buffer;)Z
    .locals 3

    .line 1
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_bufferSize:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-ne v0, v1, :cond_3

    .line 9
    .line 10
    sget-object v0, Lorg/eclipse/jetty/io/AbstractBuffers$1;->$SwitchMap$org$eclipse$jetty$io$Buffers$Type:[I

    .line 11
    .line 12
    iget-object p0, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_bufferType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    aget p0, v0, p0

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    if-eq p0, v0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x2

    .line 24
    if-eq p0, v0, :cond_1

    .line 25
    .line 26
    const/4 v0, 0x3

    .line 27
    if-eq p0, v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    instance-of p0, p1, Lorg/eclipse/jetty/io/nio/IndirectNIOBuffer;

    .line 31
    .line 32
    return p0

    .line 33
    :cond_1
    instance-of p0, p1, Lorg/eclipse/jetty/io/nio/DirectNIOBuffer;

    .line 34
    .line 35
    return p0

    .line 36
    :cond_2
    instance-of p0, p1, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 37
    .line 38
    if-eqz p0, :cond_3

    .line 39
    .line 40
    instance-of p0, p1, Lorg/eclipse/jetty/io/nio/IndirectNIOBuffer;

    .line 41
    .line 42
    if-nez p0, :cond_3

    .line 43
    .line 44
    return v0

    .line 45
    :cond_3
    :goto_0
    return v2
.end method

.method public final isHeader(Lorg/eclipse/jetty/io/Buffer;)Z
    .locals 3

    .line 1
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_headerSize:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-ne v0, v1, :cond_3

    .line 9
    .line 10
    sget-object v0, Lorg/eclipse/jetty/io/AbstractBuffers$1;->$SwitchMap$org$eclipse$jetty$io$Buffers$Type:[I

    .line 11
    .line 12
    iget-object p0, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_headerType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    aget p0, v0, p0

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    if-eq p0, v0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x2

    .line 24
    if-eq p0, v0, :cond_1

    .line 25
    .line 26
    const/4 v0, 0x3

    .line 27
    if-eq p0, v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    instance-of p0, p1, Lorg/eclipse/jetty/io/nio/IndirectNIOBuffer;

    .line 31
    .line 32
    return p0

    .line 33
    :cond_1
    instance-of p0, p1, Lorg/eclipse/jetty/io/nio/DirectNIOBuffer;

    .line 34
    .line 35
    return p0

    .line 36
    :cond_2
    instance-of p0, p1, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 37
    .line 38
    if-eqz p0, :cond_3

    .line 39
    .line 40
    instance-of p0, p1, Lorg/eclipse/jetty/io/nio/IndirectNIOBuffer;

    .line 41
    .line 42
    if-nez p0, :cond_3

    .line 43
    .line 44
    return v0

    .line 45
    :cond_3
    :goto_0
    return v2
.end method

.method public final newBuffer()Lorg/eclipse/jetty/io/Buffer;
    .locals 2

    .line 1
    sget-object v0, Lorg/eclipse/jetty/io/AbstractBuffers$1;->$SwitchMap$org$eclipse$jetty$io$Buffers$Type:[I

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_bufferType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_2

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    new-instance v0, Lorg/eclipse/jetty/io/nio/IndirectNIOBuffer;

    .line 21
    .line 22
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_bufferSize:I

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/io/nio/IndirectNIOBuffer;-><init>(I)V

    .line 25
    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return-object p0

    .line 33
    :cond_1
    new-instance v0, Lorg/eclipse/jetty/io/nio/DirectNIOBuffer;

    .line 34
    .line 35
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_bufferSize:I

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/io/nio/DirectNIOBuffer;-><init>(I)V

    .line 38
    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_2
    new-instance v0, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 42
    .line 43
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_bufferSize:I

    .line 44
    .line 45
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(I)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method

.method public final newBuffer(I)Lorg/eclipse/jetty/io/Buffer;
    .locals 1

    .line 49
    sget-object v0, Lorg/eclipse/jetty/io/AbstractBuffers$1;->$SwitchMap$org$eclipse$jetty$io$Buffers$Type:[I

    iget-object p0, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_otherType:Lorg/eclipse/jetty/io/Buffers$Type;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-ne p0, v0, :cond_0

    .line 50
    new-instance p0, Lorg/eclipse/jetty/io/nio/IndirectNIOBuffer;

    invoke-direct {p0, p1}, Lorg/eclipse/jetty/io/nio/IndirectNIOBuffer;-><init>(I)V

    return-object p0

    .line 51
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    const/4 p0, 0x0

    return-object p0

    .line 52
    :cond_1
    new-instance p0, Lorg/eclipse/jetty/io/nio/DirectNIOBuffer;

    invoke-direct {p0, p1}, Lorg/eclipse/jetty/io/nio/DirectNIOBuffer;-><init>(I)V

    return-object p0

    .line 53
    :cond_2
    new-instance p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    invoke-direct {p0, p1}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(I)V

    return-object p0
.end method

.method public final newHeader()Lorg/eclipse/jetty/io/Buffer;
    .locals 2

    .line 1
    sget-object v0, Lorg/eclipse/jetty/io/AbstractBuffers$1;->$SwitchMap$org$eclipse$jetty$io$Buffers$Type:[I

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_headerType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_2

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    new-instance v0, Lorg/eclipse/jetty/io/nio/IndirectNIOBuffer;

    .line 21
    .line 22
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_headerSize:I

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/io/nio/IndirectNIOBuffer;-><init>(I)V

    .line 25
    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return-object p0

    .line 33
    :cond_1
    new-instance v0, Lorg/eclipse/jetty/io/nio/DirectNIOBuffer;

    .line 34
    .line 35
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_headerSize:I

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/io/nio/DirectNIOBuffer;-><init>(I)V

    .line 38
    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_2
    new-instance v0, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 42
    .line 43
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_headerSize:I

    .line 44
    .line 45
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(I)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_headerSize:I

    .line 10
    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffers;->_bufferSize:I

    .line 16
    .line 17
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "%s [%d,%d]"

    .line 26
    .line 27
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method
