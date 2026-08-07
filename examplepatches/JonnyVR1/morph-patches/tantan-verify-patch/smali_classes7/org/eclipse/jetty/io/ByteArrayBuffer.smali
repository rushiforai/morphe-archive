.class public Lorg/eclipse/jetty/io/ByteArrayBuffer;
.super Lorg/eclipse/jetty/io/AbstractBuffer;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/io/ByteArrayBuffer$CaseInsensitive;
    }
.end annotation


# instance fields
.field protected final _bytes:[B


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 38
    new-array p1, p1, [B

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v1, v0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>([BIII)V

    .line 39
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    return-void
.end method

.method public constructor <init>(IIZ)V
    .locals 6

    .line 46
    new-array v1, p1, [B

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>([BIIIZ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x2

    const/4 v1, 0x0

    .line 40
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;-><init>(IZ)V

    .line 41
    invoke-static {p1}, Lorg/eclipse/jetty/util/StringUtil;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 42
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 43
    array-length v0, v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 44
    iput v1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    .line 45
    iput-object p1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_string:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    const/4 v0, 0x2

    const/4 v1, 0x0

    .line 47
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;-><init>(IZ)V

    .line 48
    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p2

    iput-object p2, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 49
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 50
    array-length p2, p2

    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 51
    iput v1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    .line 52
    iput-object p1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_string:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;-><init>(IZ)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lorg/eclipse/jetty/util/StringUtil;->getBytes(Ljava/lang/String;)[B

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 13
    .line 14
    .line 15
    array-length v0, v0

    .line 16
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 17
    .line 18
    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    iput v1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    .line 22
    .line 23
    iput-object p1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_string:Ljava/lang/String;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public constructor <init>([B)V
    .locals 3

    .line 26
    array-length v0, p1

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-direct {p0, p1, v2, v0, v1}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>([BIII)V

    return-void
.end method

.method public constructor <init>([BII)V
    .locals 1

    const/4 v0, 0x2

    .line 27
    invoke-direct {p0, p1, p2, p3, v0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>([BIII)V

    return-void
.end method

.method public constructor <init>([BIII)V
    .locals 2

    const/4 v0, 0x2

    const/4 v1, 0x0

    .line 28
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;-><init>(IZ)V

    .line 29
    iput-object p1, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    add-int/2addr p3, p2

    .line 30
    invoke-virtual {p0, p3}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 31
    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 32
    iput p4, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    return-void
.end method

.method public constructor <init>([BIIIZ)V
    .locals 1

    const/4 v0, 0x2

    .line 33
    invoke-direct {p0, v0, p5}, Lorg/eclipse/jetty/io/AbstractBuffer;-><init>(IZ)V

    .line 34
    iput-object p1, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    add-int/2addr p3, p2

    .line 35
    invoke-virtual {p0, p3}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 36
    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 37
    iput p4, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_access:I

    return-void
.end method


# virtual methods
.method public array()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public capacity()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public compact()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->isReadOnly()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_4

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
    if-lez v0, :cond_3

    .line 23
    .line 24
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    sub-int/2addr v1, v0

    .line 29
    if-lez v1, :cond_1

    .line 30
    .line 31
    iget-object v2, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-static {v2, v0, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 35
    .line 36
    .line 37
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->markIndex()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-lez v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->markIndex()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    sub-int/2addr v1, v0

    .line 48
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setMarkIndex(I)V

    .line 49
    .line 50
    .line 51
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    sub-int/2addr v1, v0

    .line 56
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    sub-int/2addr v1, v0

    .line 64
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 65
    .line 66
    .line 67
    :cond_3
    return-void

    .line 68
    :cond_4
    const-string p0, "READONLY"

    .line 69
    .line 70
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void
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
    if-eqz p1, :cond_7

    .line 7
    .line 8
    instance-of v2, p1, Lorg/eclipse/jetty/io/Buffer;

    .line 9
    .line 10
    if-nez v2, :cond_1

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_1
    instance-of v2, p1, Lorg/eclipse/jetty/io/Buffer$CaseInsensitve;

    .line 14
    .line 15
    if-eqz v2, :cond_2

    .line 16
    .line 17
    check-cast p1, Lorg/eclipse/jetty/io/Buffer;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/ByteArrayBuffer;->equalsIgnoreCase(Lorg/eclipse/jetty/io/Buffer;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_2
    move-object v2, p1

    .line 25
    check-cast v2, Lorg/eclipse/jetty/io/Buffer;

    .line 26
    .line 27
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eq v3, v4, :cond_3

    .line 36
    .line 37
    return v1

    .line 38
    :cond_3
    iget v3, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 39
    .line 40
    if-eqz v3, :cond_4

    .line 41
    .line 42
    instance-of v4, p1, Lorg/eclipse/jetty/io/AbstractBuffer;

    .line 43
    .line 44
    if-eqz v4, :cond_4

    .line 45
    .line 46
    check-cast p1, Lorg/eclipse/jetty/io/AbstractBuffer;

    .line 47
    .line 48
    iget p1, p1, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 49
    .line 50
    if-eqz p1, :cond_4

    .line 51
    .line 52
    if-eq v3, p1, :cond_4

    .line 53
    .line 54
    return v1

    .line 55
    :cond_4
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->putIndex()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    :goto_0
    add-int/lit8 v5, v4, -0x1

    .line 68
    .line 69
    if-le v4, p1, :cond_6

    .line 70
    .line 71
    iget-object v4, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 72
    .line 73
    aget-byte v4, v4, v5

    .line 74
    .line 75
    add-int/lit8 v3, v3, -0x1

    .line 76
    .line 77
    invoke-interface {v2, v3}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    .line 78
    .line 79
    .line 80
    move-result v6

    .line 81
    if-eq v4, v6, :cond_5

    .line 82
    .line 83
    return v1

    .line 84
    :cond_5
    move v4, v5

    .line 85
    goto :goto_0

    .line 86
    :cond_6
    return v0

    .line 87
    :cond_7
    :goto_1
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
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_b

    .line 7
    .line 8
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto/16 :goto_2

    .line 19
    .line 20
    :cond_1
    iget v2, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 21
    .line 22
    if-eqz v2, :cond_2

    .line 23
    .line 24
    instance-of v3, p1, Lorg/eclipse/jetty/io/AbstractBuffer;

    .line 25
    .line 26
    if-eqz v3, :cond_2

    .line 27
    .line 28
    move-object v3, p1

    .line 29
    check-cast v3, Lorg/eclipse/jetty/io/AbstractBuffer;

    .line 30
    .line 31
    iget v3, v3, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 32
    .line 33
    if-eqz v3, :cond_2

    .line 34
    .line 35
    if-eq v2, v3, :cond_2

    .line 36
    .line 37
    return v1

    .line 38
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->putIndex()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    const/16 v5, 0x7a

    .line 51
    .line 52
    const/16 v6, 0x61

    .line 53
    .line 54
    if-nez v4, :cond_6

    .line 55
    .line 56
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    :goto_0
    add-int/lit8 v7, v4, -0x1

    .line 61
    .line 62
    if-le v4, v2, :cond_a

    .line 63
    .line 64
    iget-object v4, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 65
    .line 66
    aget-byte v4, v4, v7

    .line 67
    .line 68
    add-int/lit8 v3, v3, -0x1

    .line 69
    .line 70
    invoke-interface {p1, v3}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    .line 71
    .line 72
    .line 73
    move-result v8

    .line 74
    if-eq v4, v8, :cond_5

    .line 75
    .line 76
    if-gt v6, v4, :cond_3

    .line 77
    .line 78
    if-gt v4, v5, :cond_3

    .line 79
    .line 80
    add-int/lit8 v4, v4, -0x20

    .line 81
    .line 82
    int-to-byte v4, v4

    .line 83
    :cond_3
    if-gt v6, v8, :cond_4

    .line 84
    .line 85
    if-gt v8, v5, :cond_4

    .line 86
    .line 87
    add-int/lit8 v8, v8, -0x20

    .line 88
    .line 89
    int-to-byte v8, v8

    .line 90
    :cond_4
    if-eq v4, v8, :cond_5

    .line 91
    .line 92
    return v1

    .line 93
    :cond_5
    move v4, v7

    .line 94
    goto :goto_0

    .line 95
    :cond_6
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    :goto_1
    add-int/lit8 v7, p1, -0x1

    .line 100
    .line 101
    if-le p1, v2, :cond_a

    .line 102
    .line 103
    iget-object p1, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 104
    .line 105
    aget-byte p1, p1, v7

    .line 106
    .line 107
    add-int/lit8 v3, v3, -0x1

    .line 108
    .line 109
    aget-byte v8, v4, v3

    .line 110
    .line 111
    if-eq p1, v8, :cond_9

    .line 112
    .line 113
    if-gt v6, p1, :cond_7

    .line 114
    .line 115
    if-gt p1, v5, :cond_7

    .line 116
    .line 117
    add-int/lit8 p1, p1, -0x20

    .line 118
    .line 119
    int-to-byte p1, p1

    .line 120
    :cond_7
    if-gt v6, v8, :cond_8

    .line 121
    .line 122
    if-gt v8, v5, :cond_8

    .line 123
    .line 124
    add-int/lit8 v8, v8, -0x20

    .line 125
    .line 126
    int-to-byte v8, v8

    .line 127
    :cond_8
    if-eq p1, v8, :cond_9

    .line 128
    .line 129
    return v1

    .line 130
    :cond_9
    move p1, v7

    .line 131
    goto :goto_1

    .line 132
    :cond_a
    return v0

    .line 133
    :cond_b
    :goto_2
    return v1
.end method

.method public get()B
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    .line 8
    .line 9
    aget-byte p0, v0, v1

    .line 10
    .line 11
    return p0
.end method

.method public hashCode()I
    .locals 4

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
    if-eq v0, v1, :cond_4

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    :goto_0
    add-int/lit8 v2, v1, -0x1

    .line 26
    .line 27
    if-le v1, v0, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 30
    .line 31
    aget-byte v1, v1, v2

    .line 32
    .line 33
    const/16 v3, 0x61

    .line 34
    .line 35
    if-gt v3, v1, :cond_1

    .line 36
    .line 37
    const/16 v3, 0x7a

    .line 38
    .line 39
    if-gt v1, v3, :cond_1

    .line 40
    .line 41
    add-int/lit8 v1, v1, -0x20

    .line 42
    .line 43
    int-to-byte v1, v1

    .line 44
    :cond_1
    iget v3, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 45
    .line 46
    mul-int/lit8 v3, v3, 0x1f

    .line 47
    .line 48
    add-int/2addr v3, v1

    .line 49
    iput v3, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 50
    .line 51
    move v1, v2

    .line 52
    goto :goto_0

    .line 53
    :cond_2
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 54
    .line 55
    if-nez v0, :cond_3

    .line 56
    .line 57
    const/4 v0, -0x1

    .line 58
    iput v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 59
    .line 60
    :cond_3
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    .line 61
    .line 62
    iput v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hashGet:I

    .line 63
    .line 64
    iget v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_put:I

    .line 65
    .line 66
    iput v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hashPut:I

    .line 67
    .line 68
    :cond_4
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    .line 69
    .line 70
    return p0
.end method

.method public peek(I)B
    .locals 0

    .line 27
    iget-object p0, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    aget-byte p0, p0, p1

    return p0
.end method

.method public peek(I[BII)I
    .locals 3

    .line 1
    add-int v0, p1, p4

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;->capacity()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, -0x1

    .line 8
    if-le v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;->capacity()I

    .line 11
    .line 12
    .line 13
    move-result p4

    .line 14
    sub-int/2addr p4, p1

    .line 15
    if-nez p4, :cond_0

    .line 16
    .line 17
    return v2

    .line 18
    :cond_0
    if-gez p4, :cond_1

    .line 19
    .line 20
    return v2

    .line 21
    :cond_1
    iget-object p0, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 22
    .line 23
    invoke-static {p0, p1, p2, p3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 24
    .line 25
    .line 26
    return p4
.end method

.method public poke(ILorg/eclipse/jetty/io/Buffer;)I
    .locals 6

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
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;->capacity()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-le v2, v3, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;->capacity()I

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
    if-eqz v2, :cond_1

    .line 26
    .line 27
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    iget-object p0, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 32
    .line 33
    invoke-static {v2, p2, p0, p1, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 34
    .line 35
    .line 36
    return v1

    .line 37
    :cond_1
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    :goto_0
    if-ge v0, v1, :cond_2

    .line 42
    .line 43
    iget-object v3, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 44
    .line 45
    add-int/lit8 v4, p1, 0x1

    .line 46
    .line 47
    add-int/lit8 v5, v2, 0x1

    .line 48
    .line 49
    invoke-interface {p2, v2}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    aput-byte v2, v3, p1

    .line 54
    .line 55
    add-int/lit8 v0, v0, 0x1

    .line 56
    .line 57
    move p1, v4

    .line 58
    move v2, v5

    .line 59
    goto :goto_0

    .line 60
    :cond_2
    return v1
.end method

.method public poke(I[BII)I
    .locals 2

    const/4 v0, 0x0

    .line 62
    iput v0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_hash:I

    add-int v0, p1, p4

    .line 63
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;->capacity()I

    move-result v1

    if-le v0, v1, :cond_0

    .line 64
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;->capacity()I

    move-result p4

    sub-int/2addr p4, p1

    .line 65
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    invoke-static {p2, p3, p0, p1, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return p4
.end method

.method public poke(IB)V
    .locals 0

    .line 61
    iget-object p0, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    aput-byte p2, p0, p1

    return-void
.end method

.method public readFrom(Ljava/io/InputStream;I)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    if-ltz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;->space()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-le p2, v0, :cond_1

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;->space()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    move v3, p2

    .line 19
    move v2, v1

    .line 20
    :cond_2
    if-ge v1, p2, :cond_5

    .line 21
    .line 22
    iget-object v2, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 23
    .line 24
    invoke-virtual {p1, v2, v0, v3}, Ljava/io/InputStream;->read([BII)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-gez v2, :cond_3

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_3
    if-lez v2, :cond_4

    .line 32
    .line 33
    add-int/2addr v0, v2

    .line 34
    add-int/2addr v1, v2

    .line 35
    sub-int/2addr v3, v2

    .line 36
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 37
    .line 38
    .line 39
    :cond_4
    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    if-gtz v4, :cond_2

    .line 44
    .line 45
    :cond_5
    :goto_0
    if-gez v2, :cond_6

    .line 46
    .line 47
    if-nez v1, :cond_6

    .line 48
    .line 49
    const/4 p0, -0x1

    .line 50
    return p0

    .line 51
    :cond_6
    return v1
.end method

.method public space()I
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    iget p0, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_put:I

    .line 5
    .line 6
    sub-int/2addr v0, p0

    .line 7
    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/ByteArrayBuffer;->_bytes:[B

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {p1, v0, v1, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->isImmutable()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->clear()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
