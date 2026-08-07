.class public Lorg/eclipse/jetty/io/View;
.super Lorg/eclipse/jetty/io/AbstractBuffer;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/io/View$CaseInsensitive;
    }
.end annotation


# instance fields
.field _buffer:Lorg/eclipse/jetty/io/Buffer;


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x2

    const/4 v1, 0x1

    .line 55
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;-><init>(IZ)V

    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 3

    .line 1
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->isImmutable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    xor-int/2addr v0, v1

    .line 7
    const/4 v2, 0x2

    .line 8
    invoke-direct {p0, v2, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;-><init>(IZ)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->buffer()Lorg/eclipse/jetty/io/Buffer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lorg/eclipse/jetty/io/View;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 16
    .line 17
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->putIndex()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 22
    .line 23
    .line 24
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 29
    .line 30
    .line 31
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setMarkIndex(I)V

    .line 36
    .line 37
    .line 38
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->isReadOnly()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    move v1, v2

    .line 46
    :goto_0
    iput v1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    .line 47
    .line 48
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/io/Buffer;IIII)V
    .locals 2

    .line 49
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->isImmutable()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const/4 v1, 0x2

    invoke-direct {p0, v1, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;-><init>(IZ)V

    .line 50
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->buffer()Lorg/eclipse/jetty/io/Buffer;

    move-result-object p1

    iput-object p1, p0, Lorg/eclipse/jetty/io/View;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 51
    invoke-virtual {p0, p4}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 52
    invoke-virtual {p0, p3}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 53
    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/io/AbstractBuffer;->setMarkIndex(I)V

    .line 54
    iput p5, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    return-void
.end method


# virtual methods
.method public array()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/View;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public buffer()Lorg/eclipse/jetty/io/Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/View;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->buffer()Lorg/eclipse/jetty/io/Buffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public capacity()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/View;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public clear()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setMarkIndex(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lorg/eclipse/jetty/io/View;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 10
    .line 11
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lorg/eclipse/jetty/io/View;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 19
    .line 20
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public compact()V
    .locals 0

    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-eq p0, p1, :cond_2

    .line 2
    .line 3
    instance-of v0, p1, Lorg/eclipse/jetty/io/Buffer;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    :cond_0
    invoke-super {p0, p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public isReadOnly()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/View;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->isReadOnly()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isVolatile()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public peek(I)B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/View;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public peek(I[BII)I
    .locals 0

    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/io/View;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {p0, p1, p2, p3, p4}, Lorg/eclipse/jetty/io/Buffer;->peek(I[BII)I

    move-result p0

    return p0
.end method

.method public peek(II)Lorg/eclipse/jetty/io/Buffer;
    .locals 0

    .line 9
    iget-object p0, p0, Lorg/eclipse/jetty/io/View;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {p0, p1, p2}, Lorg/eclipse/jetty/io/Buffer;->peek(II)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public poke(ILorg/eclipse/jetty/io/Buffer;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/View;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lorg/eclipse/jetty/io/Buffer;->poke(ILorg/eclipse/jetty/io/Buffer;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public poke(I[BII)I
    .locals 0

    .line 9
    iget-object p0, p0, Lorg/eclipse/jetty/io/View;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {p0, p1, p2, p3, p4}, Lorg/eclipse/jetty/io/Buffer;->poke(I[BII)I

    move-result p0

    return p0
.end method

.method public poke(IB)V
    .locals 0

    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/io/View;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {p0, p1, p2}, Lorg/eclipse/jetty/io/Buffer;->poke(IB)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/View;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "INVALID"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-super {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public update(II)V
    .locals 2

    .line 45
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    const/4 v1, 0x2

    .line 46
    iput v1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    const/4 v1, 0x0

    .line 47
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 48
    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 49
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    const/4 p1, -0x1

    .line 50
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setMarkIndex(I)V

    .line 51
    iput v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    return-void
.end method

.method public update(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    .line 3
    .line 4
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->buffer()Lorg/eclipse/jetty/io/Buffer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    iput-object v1, p0, Lorg/eclipse/jetty/io/View;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->putIndex()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setMarkIndex(I)V

    .line 33
    .line 34
    .line 35
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->isReadOnly()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    :cond_0
    iput v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    .line 43
    .line 44
    return-void
.end method
