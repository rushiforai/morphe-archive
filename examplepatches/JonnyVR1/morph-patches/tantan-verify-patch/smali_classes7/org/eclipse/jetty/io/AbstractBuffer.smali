.class public abstract Lorg/eclipse/jetty/io/AbstractBuffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/io/Buffer;


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;

.field protected static final __IMMUTABLE:Ljava/lang/String; = "IMMUTABLE"

.field protected static final __READONLY:Ljava/lang/String; = "READONLY"

.field protected static final __READWRITE:Ljava/lang/String; = "READWRITE"

.field protected static final __VOLATILE:Ljava/lang/String; = "VOLATILE"

.field private static final __boundsChecking:Z


# instance fields
.field protected _access:I

.field protected _get:I

.field protected _hash:I

.field protected _hashGet:I

.field protected _hashPut:I

.field protected _mark:I

.field protected _put:I

.field protected _string:Ljava/lang/String;

.field protected _view:Lorg/eclipse/jetty/io/View;

.field protected _volatile:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/io/AbstractBuffer;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/io/AbstractBuffer;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    const-string v0, "org.eclipse.jetty.io.AbstractBuffer.boundsChecking"

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput-boolean v0, Lorg/eclipse/jetty/io/AbstractBuffer;->__boundsChecking:Z

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_1

    .line 5
    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const-string p0, "IMMUTABLE && VOLATILE"

    .line 10
    .line 11
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    throw p0

    .line 16
    :cond_1
    :goto_0
    const/4 v0, -0x1

    .line 17
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setMarkIndex(I)V

    .line 18
    .line 19
    .line 20
    iput p1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    .line 21
    .line 22
    iput-boolean p2, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_volatile:Z

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public asArray()[B
    .locals 4

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-array v1, v0, [B

    .line 6
    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/4 v3, 0x0

    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {v2, p0, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 19
    .line 20
    .line 21
    return-object v1

    .line 22
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-interface {p0, v0, v1, v3, v2}, Lorg/eclipse/jetty/io/Buffer;->peek(I[BII)I

    .line 31
    .line 32
    .line 33
    return-object v1
.end method

.method public asImmutableBuffer()Lorg/eclipse/jetty/io/Buffer;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->isImmutable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->duplicate(I)Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public asMutableBuffer()Lorg/eclipse/jetty/io/Buffer;
    .locals 7

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->isImmutable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->buffer()Lorg/eclipse/jetty/io/Buffer;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->isReadOnly()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->duplicate(I)Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_1
    new-instance v1, Lorg/eclipse/jetty/io/View;

    .line 25
    .line 26
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->markIndex()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    iget v6, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    .line 39
    .line 40
    invoke-direct/range {v1 .. v6}, Lorg/eclipse/jetty/io/View;-><init>(Lorg/eclipse/jetty/io/Buffer;IIII)V

    .line 41
    .line 42
    .line 43
    return-object v1
.end method

.method public asNonVolatileBuffer()Lorg/eclipse/jetty/io/Buffer;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->isVolatile()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->duplicate(I)Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public asReadOnlyBuffer()Lorg/eclipse/jetty/io/Buffer;
    .locals 7

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->isReadOnly()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance v1, Lorg/eclipse/jetty/io/View;

    .line 9
    .line 10
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->markIndex()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    const/4 v6, 0x1

    .line 23
    move-object v2, p0

    .line 24
    invoke-direct/range {v1 .. v6}, Lorg/eclipse/jetty/io/View;-><init>(Lorg/eclipse/jetty/io/Buffer;IIII)V

    .line 25
    .line 26
    .line 27
    return-object v1
.end method

.method public buffer()Lorg/eclipse/jetty/io/Buffer;
    .locals 0

    return-object p0
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
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public compact()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->isReadOnly()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_5

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->markIndex()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-ltz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->markIndex()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    :goto_0
    if-lez v0, :cond_4

    .line 23
    .line 24
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    sub-int/2addr v2, v0

    .line 33
    if-lez v2, :cond_2

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-static {v1, v0, v4, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    invoke-virtual {p0, v0, v2}, Lorg/eclipse/jetty/io/AbstractBuffer;->peek(II)Lorg/eclipse/jetty/io/Buffer;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p0, v3, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->poke(ILorg/eclipse/jetty/io/Buffer;)I

    .line 55
    .line 56
    .line 57
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->markIndex()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-lez v1, :cond_3

    .line 62
    .line 63
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->markIndex()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    sub-int/2addr v1, v0

    .line 68
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setMarkIndex(I)V

    .line 69
    .line 70
    .line 71
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    sub-int/2addr v1, v0

    .line 76
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    sub-int/2addr v1, v0

    .line 84
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 85
    .line 86
    .line 87
    :cond_4
    return-void

    .line 88
    :cond_5
    const-string p0, "READONLY"

    .line 89
    .line 90
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public duplicate(I)Lorg/eclipse/jetty/io/ByteArrayBuffer;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->buffer()Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, p0, Lorg/eclipse/jetty/io/Buffer$CaseInsensitve;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    instance-of v0, v0, Lorg/eclipse/jetty/io/Buffer$CaseInsensitve;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    new-instance v0, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 16
    .line 17
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->asArray()[B

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-direct {v0, v1, v2, p0, p1}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>([BIII)V

    .line 26
    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_1
    :goto_0
    new-instance v0, Lorg/eclipse/jetty/io/ByteArrayBuffer$CaseInsensitive;

    .line 30
    .line 31
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->asArray()[B

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-direct {v0, v1, v2, p0, p1}, Lorg/eclipse/jetty/io/ByteArrayBuffer$CaseInsensitive;-><init>([BIII)V

    .line 40
    .line 41
    .line 42
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_8

    .line 7
    .line 8
    instance-of v2, p1, Lorg/eclipse/jetty/io/Buffer;

    .line 9
    .line 10
    if-nez v2, :cond_1

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_1
    move-object v2, p1

    .line 14
    check-cast v2, Lorg/eclipse/jetty/io/Buffer;

    .line 15
    .line 16
    instance-of v3, p0, Lorg/eclipse/jetty/io/Buffer$CaseInsensitve;

    .line 17
    .line 18
    if-nez v3, :cond_7

    .line 19
    .line 20
    instance-of v3, v2, Lorg/eclipse/jetty/io/Buffer$CaseInsensitve;

    .line 21
    .line 22
    if-eqz v3, :cond_2

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_2
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-eq v3, v4, :cond_3

    .line 34
    .line 35
    return v1

    .line 36
    :cond_3
    iget v3, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 37
    .line 38
    if-eqz v3, :cond_4

    .line 39
    .line 40
    instance-of v4, p1, Lorg/eclipse/jetty/io/AbstractBuffer;

    .line 41
    .line 42
    if-eqz v4, :cond_4

    .line 43
    .line 44
    check-cast p1, Lorg/eclipse/jetty/io/AbstractBuffer;

    .line 45
    .line 46
    iget p1, p1, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 47
    .line 48
    if-eqz p1, :cond_4

    .line 49
    .line 50
    if-eq v3, p1, :cond_4

    .line 51
    .line 52
    return v1

    .line 53
    :cond_4
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->putIndex()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    :goto_0
    add-int/lit8 v5, v4, -0x1

    .line 66
    .line 67
    if-le v4, p1, :cond_6

    .line 68
    .line 69
    invoke-interface {p0, v5}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    add-int/lit8 v3, v3, -0x1

    .line 74
    .line 75
    invoke-interface {v2, v3}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    .line 76
    .line 77
    .line 78
    move-result v6

    .line 79
    if-eq v4, v6, :cond_5

    .line 80
    .line 81
    return v1

    .line 82
    :cond_5
    move v4, v5

    .line 83
    goto :goto_0

    .line 84
    :cond_6
    return v0

    .line 85
    :cond_7
    :goto_1
    invoke-virtual {p0, v2}, Lorg/eclipse/jetty/io/AbstractBuffer;->equalsIgnoreCase(Lorg/eclipse/jetty/io/Buffer;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    return p0

    .line 90
    :cond_8
    :goto_2
    return v1
.end method

.method public equalsIgnoreCase(Lorg/eclipse/jetty/io/Buffer;)Z
    .locals 9

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    if-eq v1, v2, :cond_1

    .line 15
    .line 16
    return v3

    .line 17
    :cond_1
    iget v1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 18
    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    instance-of v2, p1, Lorg/eclipse/jetty/io/AbstractBuffer;

    .line 22
    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    move-object v2, p1

    .line 26
    check-cast v2, Lorg/eclipse/jetty/io/AbstractBuffer;

    .line 27
    .line 28
    iget v2, v2, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 29
    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    if-eq v1, v2, :cond_2

    .line 33
    .line 34
    return v3

    .line 35
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->putIndex()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    const/16 v6, 0x7a

    .line 52
    .line 53
    const/16 v7, 0x61

    .line 54
    .line 55
    if-eqz v4, :cond_6

    .line 56
    .line 57
    if-eqz v5, :cond_6

    .line 58
    .line 59
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    :goto_0
    add-int/lit8 p1, p0, -0x1

    .line 64
    .line 65
    if-le p0, v1, :cond_a

    .line 66
    .line 67
    aget-byte p0, v4, p1

    .line 68
    .line 69
    add-int/lit8 v2, v2, -0x1

    .line 70
    .line 71
    aget-byte v8, v5, v2

    .line 72
    .line 73
    if-eq p0, v8, :cond_5

    .line 74
    .line 75
    if-gt v7, p0, :cond_3

    .line 76
    .line 77
    if-gt p0, v6, :cond_3

    .line 78
    .line 79
    add-int/lit8 p0, p0, -0x20

    .line 80
    .line 81
    int-to-byte p0, p0

    .line 82
    :cond_3
    if-gt v7, v8, :cond_4

    .line 83
    .line 84
    if-gt v8, v6, :cond_4

    .line 85
    .line 86
    add-int/lit8 v8, v8, -0x20

    .line 87
    .line 88
    int-to-byte v8, v8

    .line 89
    :cond_4
    if-eq p0, v8, :cond_5

    .line 90
    .line 91
    return v3

    .line 92
    :cond_5
    move p0, p1

    .line 93
    goto :goto_0

    .line 94
    :cond_6
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    :goto_1
    add-int/lit8 v5, v4, -0x1

    .line 99
    .line 100
    if-le v4, v1, :cond_a

    .line 101
    .line 102
    invoke-interface {p0, v5}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    add-int/lit8 v2, v2, -0x1

    .line 107
    .line 108
    invoke-interface {p1, v2}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    .line 109
    .line 110
    .line 111
    move-result v8

    .line 112
    if-eq v4, v8, :cond_9

    .line 113
    .line 114
    if-gt v7, v4, :cond_7

    .line 115
    .line 116
    if-gt v4, v6, :cond_7

    .line 117
    .line 118
    add-int/lit8 v4, v4, -0x20

    .line 119
    .line 120
    int-to-byte v4, v4

    .line 121
    :cond_7
    if-gt v7, v8, :cond_8

    .line 122
    .line 123
    if-gt v8, v6, :cond_8

    .line 124
    .line 125
    add-int/lit8 v8, v8, -0x20

    .line 126
    .line 127
    int-to-byte v8, v8

    .line 128
    :cond_8
    if-eq v4, v8, :cond_9

    .line 129
    .line 130
    return v3

    .line 131
    :cond_9
    move v4, v5

    .line 132
    goto :goto_1

    .line 133
    :cond_a
    return v0
.end method

.method public get()B
    .locals 2

    .line 27
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    invoke-interface {p0, v0}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    move-result p0

    return p0
.end method

.method public get([BII)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const/4 p0, -0x1

    .line 12
    return p0

    .line 13
    :cond_0
    if-le p3, v1, :cond_1

    .line 14
    .line 15
    move p3, v1

    .line 16
    :cond_1
    invoke-interface {p0, v0, p1, p2, p3}, Lorg/eclipse/jetty/io/Buffer;->peek(I[BII)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-lez p1, :cond_2

    .line 21
    .line 22
    add-int/2addr v0, p1

    .line 23
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 24
    .line 25
    .line 26
    :cond_2
    return p1
.end method

.method public get(I)Lorg/eclipse/jetty/io/Buffer;
    .locals 2

    .line 28
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    move-result v0

    .line 29
    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->peek(II)Lorg/eclipse/jetty/io/Buffer;

    move-result-object v1

    add-int/2addr v0, p1

    .line 30
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    return-object v1
.end method

.method public final getIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    .line 2
    .line 3
    return p0
.end method

.method public hasContent()Z
    .locals 1

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_put:I

    .line 2
    .line 3
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    .line 4
    .line 5
    if-le v0, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public hashCode()I
    .locals 7

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hashGet:I

    .line 6
    .line 7
    iget v1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hashPut:I

    .line 12
    .line 13
    iget v1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_put:I

    .line 14
    .line 15
    if-eq v0, v1, :cond_6

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/16 v2, 0x7a

    .line 26
    .line 27
    const/16 v3, 0x61

    .line 28
    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    :goto_0
    add-int/lit8 v4, v1, -0x1

    .line 36
    .line 37
    if-le v1, v0, :cond_4

    .line 38
    .line 39
    invoke-interface {p0, v4}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-gt v3, v1, :cond_1

    .line 44
    .line 45
    if-gt v1, v2, :cond_1

    .line 46
    .line 47
    add-int/lit8 v1, v1, -0x20

    .line 48
    .line 49
    int-to-byte v1, v1

    .line 50
    :cond_1
    iget v5, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 51
    .line 52
    mul-int/lit8 v5, v5, 0x1f

    .line 53
    .line 54
    add-int/2addr v5, v1

    .line 55
    iput v5, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 56
    .line 57
    move v1, v4

    .line 58
    goto :goto_0

    .line 59
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    :goto_1
    add-int/lit8 v5, v4, -0x1

    .line 64
    .line 65
    if-le v4, v0, :cond_4

    .line 66
    .line 67
    aget-byte v4, v1, v5

    .line 68
    .line 69
    if-gt v3, v4, :cond_3

    .line 70
    .line 71
    if-gt v4, v2, :cond_3

    .line 72
    .line 73
    add-int/lit8 v4, v4, -0x20

    .line 74
    .line 75
    int-to-byte v4, v4

    .line 76
    :cond_3
    iget v6, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 77
    .line 78
    mul-int/lit8 v6, v6, 0x1f

    .line 79
    .line 80
    add-int/2addr v6, v4

    .line 81
    iput v6, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 82
    .line 83
    move v4, v5

    .line 84
    goto :goto_1

    .line 85
    :cond_4
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 86
    .line 87
    if-nez v0, :cond_5

    .line 88
    .line 89
    const/4 v0, -0x1

    .line 90
    iput v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 91
    .line 92
    :cond_5
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    .line 93
    .line 94
    iput v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hashGet:I

    .line 95
    .line 96
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_put:I

    .line 97
    .line 98
    iput v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hashPut:I

    .line 99
    .line 100
    :cond_6
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 101
    .line 102
    return p0
.end method

.method public isImmutable()Z
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    .line 2
    .line 3
    if-gtz p0, :cond_0

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

.method public isReadOnly()Z
    .locals 1

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-gt p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isVolatile()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_volatile:Z

    .line 2
    .line 3
    return p0
.end method

.method public length()I
    .locals 1

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_put:I

    .line 2
    .line 3
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public mark()V
    .locals 1

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setMarkIndex(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public mark(I)V
    .locals 1

    .line 9
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setMarkIndex(I)V

    return-void
.end method

.method public markIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_mark:I

    .line 2
    .line 3
    return p0
.end method

.method public peek()B
    .locals 1

    .line 65
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    invoke-interface {p0, v0}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    move-result p0

    return p0
.end method

.method public peek(II)Lorg/eclipse/jetty/io/Buffer;
    .locals 7

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_view:Lorg/eclipse/jetty/io/View;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v1, Lorg/eclipse/jetty/io/View;

    .line 6
    .line 7
    add-int v5, p1, p2

    .line 8
    .line 9
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->isReadOnly()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    const/4 p2, 0x1

    .line 16
    :goto_0
    move v6, p2

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const/4 p2, 0x2

    .line 19
    goto :goto_0

    .line 20
    :goto_1
    const/4 v3, -0x1

    .line 21
    move-object v2, p0

    .line 22
    move v4, p1

    .line 23
    invoke-direct/range {v1 .. v6}, Lorg/eclipse/jetty/io/View;-><init>(Lorg/eclipse/jetty/io/Buffer;IIII)V

    .line 24
    .line 25
    .line 26
    iput-object v1, v2, Lorg/eclipse/jetty/io/AbstractBuffer;->_view:Lorg/eclipse/jetty/io/View;

    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_1
    move-object v2, p0

    .line 30
    move v4, p1

    .line 31
    invoke-virtual {v2}, Lorg/eclipse/jetty/io/AbstractBuffer;->buffer()Lorg/eclipse/jetty/io/Buffer;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/io/View;->update(Lorg/eclipse/jetty/io/Buffer;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, v2, Lorg/eclipse/jetty/io/AbstractBuffer;->_view:Lorg/eclipse/jetty/io/View;

    .line 39
    .line 40
    const/4 p1, -0x1

    .line 41
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setMarkIndex(I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, v2, Lorg/eclipse/jetty/io/AbstractBuffer;->_view:Lorg/eclipse/jetty/io/View;

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 48
    .line 49
    .line 50
    iget-object p0, v2, Lorg/eclipse/jetty/io/AbstractBuffer;->_view:Lorg/eclipse/jetty/io/View;

    .line 51
    .line 52
    add-int p1, v4, p2

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 55
    .line 56
    .line 57
    iget-object p0, v2, Lorg/eclipse/jetty/io/AbstractBuffer;->_view:Lorg/eclipse/jetty/io/View;

    .line 58
    .line 59
    invoke-virtual {p0, v4}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 60
    .line 61
    .line 62
    :goto_2
    iget-object p0, v2, Lorg/eclipse/jetty/io/AbstractBuffer;->_view:Lorg/eclipse/jetty/io/View;

    .line 63
    .line 64
    return-object p0
.end method

.method public poke(ILorg/eclipse/jetty/io/Buffer;)I
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 3
    .line 4
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    add-int v2, p1, v1

    .line 9
    .line 10
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-le v2, v3, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    sub-int/2addr v1, p1

    .line 21
    :cond_0
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-static {v2, p0, v3, p1, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 38
    .line 39
    .line 40
    return v1

    .line 41
    :cond_1
    if-eqz v2, :cond_2

    .line 42
    .line 43
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    :goto_0
    if-ge v0, v1, :cond_4

    .line 48
    .line 49
    add-int/lit8 v3, p1, 0x1

    .line 50
    .line 51
    add-int/lit8 v4, p2, 0x1

    .line 52
    .line 53
    aget-byte p2, v2, p2

    .line 54
    .line 55
    invoke-interface {p0, p1, p2}, Lorg/eclipse/jetty/io/Buffer;->poke(IB)V

    .line 56
    .line 57
    .line 58
    add-int/lit8 v0, v0, 0x1

    .line 59
    .line 60
    move p1, v3

    .line 61
    move p2, v4

    .line 62
    goto :goto_0

    .line 63
    :cond_2
    if-eqz v3, :cond_3

    .line 64
    .line 65
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    :goto_1
    if-ge v0, v1, :cond_4

    .line 70
    .line 71
    add-int/lit8 v2, p1, 0x1

    .line 72
    .line 73
    add-int/lit8 v4, p0, 0x1

    .line 74
    .line 75
    invoke-interface {p2, p0}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    aput-byte p0, v3, p1

    .line 80
    .line 81
    add-int/lit8 v0, v0, 0x1

    .line 82
    .line 83
    move p1, v2

    .line 84
    move p0, v4

    .line 85
    goto :goto_1

    .line 86
    :cond_3
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    :goto_2
    if-ge v0, v1, :cond_4

    .line 91
    .line 92
    add-int/lit8 v3, p1, 0x1

    .line 93
    .line 94
    add-int/lit8 v4, v2, 0x1

    .line 95
    .line 96
    invoke-interface {p2, v2}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    invoke-interface {p0, p1, v2}, Lorg/eclipse/jetty/io/Buffer;->poke(IB)V

    .line 101
    .line 102
    .line 103
    add-int/lit8 v0, v0, 0x1

    .line 104
    .line 105
    move p1, v3

    .line 106
    move v2, v4

    .line 107
    goto :goto_2

    .line 108
    :cond_4
    return v1
.end method

.method public poke(I[BII)I
    .locals 3

    const/4 v0, 0x0

    .line 109
    iput v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    add-int v1, p1, p4

    .line 110
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    move-result v2

    if-le v1, v2, :cond_0

    .line 111
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    move-result p4

    sub-int/2addr p4, p1

    .line 112
    :cond_0
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    move-result-object v1

    if-eqz v1, :cond_1

    .line 113
    invoke-static {p2, p3, v1, p1, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return p4

    :cond_1
    :goto_0
    if-ge v0, p4, :cond_2

    add-int/lit8 v1, p1, 0x1

    add-int/lit8 v2, p3, 0x1

    .line 114
    aget-byte p3, p2, p3

    invoke-interface {p0, p1, p3}, Lorg/eclipse/jetty/io/Buffer;->poke(IB)V

    add-int/lit8 v0, v0, 0x1

    move p1, v1

    move p3, v2

    goto :goto_0

    :cond_2
    return p4
.end method

.method public put(Lorg/eclipse/jetty/io/Buffer;)I
    .locals 1

    .line 22
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    move-result v0

    .line 23
    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->poke(ILorg/eclipse/jetty/io/Buffer;)I

    move-result p1

    add-int/2addr v0, p1

    .line 24
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    return p1
.end method

.method public put([B)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    array-length v2, p1

    .line 7
    invoke-virtual {p0, v0, p1, v1, v2}, Lorg/eclipse/jetty/io/AbstractBuffer;->poke(I[BII)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    add-int/2addr v0, p1

    .line 12
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 13
    .line 14
    .line 15
    return p1
.end method

.method public put([BII)I
    .locals 1

    .line 19
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    move-result v0

    .line 20
    invoke-virtual {p0, v0, p1, p2, p3}, Lorg/eclipse/jetty/io/AbstractBuffer;->poke(I[BII)I

    move-result p1

    add-int/2addr v0, p1

    .line 21
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    return p1
.end method

.method public put(B)V
    .locals 1

    .line 16
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    move-result v0

    .line 17
    invoke-interface {p0, v0, p1}, Lorg/eclipse/jetty/io/Buffer;->poke(IB)V

    add-int/lit8 v0, v0, 0x1

    .line 18
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    return-void
.end method

.method public final putIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_put:I

    .line 2
    .line 3
    return p0
.end method

.method public readFrom(Ljava/io/InputStream;I)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->space()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-le v1, p2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move p2, v1

    .line 13
    :goto_0
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget v1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_put:I

    .line 16
    .line 17
    invoke-virtual {p1, v0, v1, p2}, Ljava/io/InputStream;->read([BII)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-lez p1, :cond_1

    .line 22
    .line 23
    iget p2, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_put:I

    .line 24
    .line 25
    add-int/2addr p2, p1

    .line 26
    iput p2, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_put:I

    .line 27
    .line 28
    :cond_1
    return p1

    .line 29
    :cond_2
    const/16 v0, 0x400

    .line 30
    .line 31
    if-le p2, v0, :cond_3

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_3
    move v0, p2

    .line 35
    :goto_1
    new-array v1, v0, [B

    .line 36
    .line 37
    :goto_2
    const/4 v2, 0x0

    .line 38
    if-lez p2, :cond_5

    .line 39
    .line 40
    invoke-virtual {p1, v1, v2, v0}, Ljava/io/InputStream;->read([BII)I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-gez v3, :cond_4

    .line 45
    .line 46
    const/4 p0, -0x1

    .line 47
    return p0

    .line 48
    :cond_4
    invoke-virtual {p0, v1, v2, v3}, Lorg/eclipse/jetty/io/AbstractBuffer;->put([BII)I

    .line 49
    .line 50
    .line 51
    sub-int/2addr p2, v3

    .line 52
    goto :goto_2

    .line 53
    :cond_5
    return v2
.end method

.method public reset()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->markIndex()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->markIndex()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public rewind()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setMarkIndex(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setGetIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 5
    .line 6
    return-void
.end method

.method public setMarkIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_mark:I

    .line 2
    .line 3
    return-void
.end method

.method public setPutIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_put:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 5
    .line 6
    return-void
.end method

.method public skip(I)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ge v0, p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr v0, p1

    .line 16
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 17
    .line 18
    .line 19
    return p1
.end method

.method public slice()Lorg/eclipse/jetty/io/Buffer;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->peek(II)Lorg/eclipse/jetty/io/Buffer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public sliceFromMark()Lorg/eclipse/jetty/io/Buffer;
    .locals 2

    .line 22
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    move-result v0

    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->markIndex()I

    move-result v1

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->sliceFromMark(I)Lorg/eclipse/jetty/io/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public sliceFromMark(I)Lorg/eclipse/jetty/io/Buffer;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->markIndex()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->markIndex()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->peek(II)Lorg/eclipse/jetty/io/Buffer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/4 v0, -0x1

    .line 18
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setMarkIndex(I)V

    .line 19
    .line 20
    .line 21
    return-object p1
.end method

.method public space()I
    .locals 1

    .line 1
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_put:I

    .line 6
    .line 7
    sub-int/2addr v0, p0

    .line 8
    return v0
.end method

.method public toDebugString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "@"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public toDetailString()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "["

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, ","

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->buffer()Lorg/eclipse/jetty/io/Buffer;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v1, ",m="

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->markIndex()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, ",g="

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v1, ",p="

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v1, ",c="

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v1, "]={"

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->markIndex()I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-ltz v1, :cond_1

    .line 92
    .line 93
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->markIndex()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-ge v1, v2, :cond_0

    .line 102
    .line 103
    invoke-interface {p0, v1}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    invoke-static {v2, v0}, Lorg/eclipse/jetty/util/TypeUtil;->toHex(BLjava/lang/Appendable;)V

    .line 108
    .line 109
    .line 110
    add-int/lit8 v1, v1, 0x1

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_0
    const-string v1, "}{"

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    const/4 v2, 0x0

    .line 123
    :goto_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    if-ge v1, v3, :cond_3

    .line 128
    .line 129
    invoke-interface {p0, v1}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    invoke-static {v3, v0}, Lorg/eclipse/jetty/util/TypeUtil;->toHex(BLjava/lang/Appendable;)V

    .line 134
    .line 135
    .line 136
    add-int/lit8 v3, v2, 0x1

    .line 137
    .line 138
    const/16 v4, 0x32

    .line 139
    .line 140
    if-ne v2, v4, :cond_2

    .line 141
    .line 142
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    sub-int/2addr v2, v1

    .line 147
    const/16 v4, 0x14

    .line 148
    .line 149
    if-le v2, v4, :cond_2

    .line 150
    .line 151
    const-string v1, " ... "

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    sub-int/2addr v1, v4

    .line 161
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 162
    .line 163
    move v2, v3

    .line 164
    goto :goto_1

    .line 165
    :cond_3
    const/16 p0, 0x7d

    .line 166
    .line 167
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 57
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->isImmutable()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 58
    iget-object v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_string:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 59
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->asArray()[B

    move-result-object v2

    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    move-result v3

    invoke-direct {v0, v2, v1, v3}, Ljava/lang/String;-><init>([BII)V

    iput-object v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_string:Ljava/lang/String;

    .line 60
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_string:Ljava/lang/String;

    return-object p0

    .line 61
    :cond_1
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->asArray()[B

    move-result-object v2

    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    move-result p0

    invoke-direct {v0, v2, v1, p0}, Ljava/lang/String;-><init>([BII)V

    return-object v0
.end method

.method public toString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    new-instance v2, Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    invoke-direct {v2, v1, v3, v4, p1}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-object v2

    .line 22
    :catch_0
    move-exception p1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance v1, Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->asArray()[B

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-direct {v1, v2, v0, v3, p1}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    return-object v1

    .line 38
    :goto_0
    sget-object v1, Lorg/eclipse/jetty/io/AbstractBuffer;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 39
    .line 40
    invoke-interface {v1, p1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    new-instance p1, Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->asArray()[B

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-direct {p1, v1, v0, p0}, Ljava/lang/String;-><init>([BII)V

    .line 54
    .line 55
    .line 56
    return-object p1
.end method

.method public toString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 5

    const/4 v0, 0x0

    .line 62
    :try_start_0
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    move-result-object v1

    if-eqz v1, :cond_0

    .line 63
    new-instance v2, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    move-result v3

    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    move-result v4

    invoke-direct {v2, v1, v3, v4, p1}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    return-object v2

    :catch_0
    move-exception p1

    goto :goto_0

    .line 64
    :cond_0
    new-instance v1, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->asArray()[B

    move-result-object v2

    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    move-result v3

    invoke-direct {v1, v2, v0, v3, p1}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 65
    :goto_0
    sget-object v1, Lorg/eclipse/jetty/io/AbstractBuffer;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    invoke-interface {v1, p1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 66
    new-instance p1, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->asArray()[B

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    move-result p0

    invoke-direct {p1, v1, v0, p0}, Ljava/lang/String;-><init>([BII)V

    return-object p1
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-virtual {p1, v0, v1, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 16
    .line 17
    .line 18
    goto :goto_3

    .line 19
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/16 v1, 0x400

    .line 24
    .line 25
    if-le v0, v1, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move v1, v0

    .line 29
    :goto_0
    new-array v2, v1, [B

    .line 30
    .line 31
    iget v3, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    .line 32
    .line 33
    :goto_1
    if-lez v0, :cond_3

    .line 34
    .line 35
    if-le v0, v1, :cond_2

    .line 36
    .line 37
    move v4, v1

    .line 38
    goto :goto_2

    .line 39
    :cond_2
    move v4, v0

    .line 40
    :goto_2
    const/4 v5, 0x0

    .line 41
    invoke-interface {p0, v3, v2, v5, v4}, Lorg/eclipse/jetty/io/Buffer;->peek(I[BII)I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    invoke-virtual {p1, v2, v5, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 46
    .line 47
    .line 48
    add-int/2addr v3, v4

    .line 49
    sub-int/2addr v0, v4

    .line 50
    goto :goto_1

    .line 51
    :cond_3
    :goto_3
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->clear()V

    .line 52
    .line 53
    .line 54
    return-void
.end method
