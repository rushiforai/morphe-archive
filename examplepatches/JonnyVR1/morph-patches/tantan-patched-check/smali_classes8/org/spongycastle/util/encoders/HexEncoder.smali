.class public Lorg/spongycastle/util/encoders/HexEncoder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/util/encoders/Encoder;


# instance fields
.field protected final decodingTable:[B

.field protected final encodingTable:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x10

    .line 5
    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    fill-array-data v0, :array_0

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lorg/spongycastle/util/encoders/HexEncoder;->encodingTable:[B

    .line 12
    .line 13
    const/16 v0, 0x80

    .line 14
    .line 15
    new-array v0, v0, [B

    .line 16
    .line 17
    iput-object v0, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    .line 18
    .line 19
    invoke-virtual {p0}, Lorg/spongycastle/util/encoders/HexEncoder;->initialiseDecodingTable()V

    .line 20
    .line 21
    .line 22
    return-void

    :array_0
    .array-data 1
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
    .end array-data
.end method

.method private static ignore(C)Z
    .locals 1

    const/16 v0, 0xa

    if-eq p0, v0, :cond_1

    const/16 v0, 0xd

    if-eq p0, v0, :cond_1

    const/16 v0, 0x9

    if-eq p0, v0, :cond_1

    const/16 v0, 0x20

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public decode(Ljava/lang/String;Ljava/io/OutputStream;)I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    :goto_0
    if-lez v0, :cond_1

    .line 6
    .line 7
    add-int/lit8 v1, v0, -0x1

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v1}, Lorg/spongycastle/util/encoders/HexEncoder;->ignore(C)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    :goto_1
    const/4 v1, 0x0

    .line 24
    move v2, v1

    .line 25
    move v3, v2

    .line 26
    :goto_2
    if-ge v2, v0, :cond_5

    .line 27
    .line 28
    :goto_3
    if-ge v2, v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    invoke-static {v4}, Lorg/spongycastle/util/encoders/HexEncoder;->ignore(C)Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-eqz v4, :cond_2

    .line 39
    .line 40
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    goto :goto_3

    .line 43
    :cond_2
    iget-object v4, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    .line 44
    .line 45
    add-int/lit8 v5, v2, 0x1

    .line 46
    .line 47
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    aget-byte v2, v4, v2

    .line 52
    .line 53
    :goto_4
    if-ge v5, v0, :cond_3

    .line 54
    .line 55
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    invoke-static {v4}, Lorg/spongycastle/util/encoders/HexEncoder;->ignore(C)Z

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    if-eqz v4, :cond_3

    .line 64
    .line 65
    add-int/lit8 v5, v5, 0x1

    .line 66
    .line 67
    goto :goto_4

    .line 68
    :cond_3
    iget-object v4, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    .line 69
    .line 70
    add-int/lit8 v6, v5, 0x1

    .line 71
    .line 72
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    aget-byte v4, v4, v5

    .line 77
    .line 78
    or-int v5, v2, v4

    .line 79
    .line 80
    if-ltz v5, :cond_4

    .line 81
    .line 82
    shl-int/lit8 v2, v2, 0x4

    .line 83
    .line 84
    or-int/2addr v2, v4

    .line 85
    invoke-virtual {p2, v2}, Ljava/io/OutputStream;->write(I)V

    .line 86
    .line 87
    .line 88
    add-int/lit8 v3, v3, 0x1

    .line 89
    .line 90
    move v2, v6

    .line 91
    goto :goto_2

    .line 92
    :cond_4
    const-string p0, "invalid characters encountered in Hex string"

    .line 93
    .line 94
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    return v1

    .line 98
    :cond_5
    return v3
.end method

.method public decode([BIILjava/io/OutputStream;)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    add-int/2addr p3, p2

    :goto_0
    if-le p3, p2, :cond_1

    add-int/lit8 v0, p3, -0x1

    .line 99
    aget-byte v0, p1, v0

    int-to-char v0, v0

    invoke-static {v0}, Lorg/spongycastle/util/encoders/HexEncoder;->ignore(C)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 p3, p3, -0x1

    goto :goto_0

    :cond_1
    :goto_1
    const/4 v0, 0x0

    move v1, v0

    :goto_2
    if-ge p2, p3, :cond_5

    :goto_3
    if-ge p2, p3, :cond_2

    .line 100
    aget-byte v2, p1, p2

    int-to-char v2, v2

    invoke-static {v2}, Lorg/spongycastle/util/encoders/HexEncoder;->ignore(C)Z

    move-result v2

    if-eqz v2, :cond_2

    add-int/lit8 p2, p2, 0x1

    goto :goto_3

    .line 101
    :cond_2
    iget-object v2, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    add-int/lit8 v3, p2, 0x1

    aget-byte p2, p1, p2

    aget-byte p2, v2, p2

    :goto_4
    if-ge v3, p3, :cond_3

    .line 102
    aget-byte v2, p1, v3

    int-to-char v2, v2

    invoke-static {v2}, Lorg/spongycastle/util/encoders/HexEncoder;->ignore(C)Z

    move-result v2

    if-eqz v2, :cond_3

    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 103
    :cond_3
    iget-object v2, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    add-int/lit8 v4, v3, 0x1

    aget-byte v3, p1, v3

    aget-byte v2, v2, v3

    or-int v3, p2, v2

    if-ltz v3, :cond_4

    shl-int/lit8 p2, p2, 0x4

    or-int/2addr p2, v2

    .line 104
    invoke-virtual {p4, p2}, Ljava/io/OutputStream;->write(I)V

    add-int/lit8 v1, v1, 0x1

    move p2, v4

    goto :goto_2

    .line 105
    :cond_4
    const-string p0, "invalid characters encountered in Hex data"

    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    return v0

    :cond_5
    return v1
.end method

.method public encode([BIILjava/io/OutputStream;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move v0, p2

    .line 2
    :goto_0
    add-int v1, p2, p3

    .line 3
    .line 4
    if-ge v0, v1, :cond_0

    .line 5
    .line 6
    aget-byte v1, p1, v0

    .line 7
    .line 8
    and-int/lit16 v2, v1, 0xff

    .line 9
    .line 10
    iget-object v3, p0, Lorg/spongycastle/util/encoders/HexEncoder;->encodingTable:[B

    .line 11
    .line 12
    ushr-int/lit8 v2, v2, 0x4

    .line 13
    .line 14
    aget-byte v2, v3, v2

    .line 15
    .line 16
    invoke-virtual {p4, v2}, Ljava/io/OutputStream;->write(I)V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Lorg/spongycastle/util/encoders/HexEncoder;->encodingTable:[B

    .line 20
    .line 21
    and-int/lit8 v1, v1, 0xf

    .line 22
    .line 23
    aget-byte v1, v2, v1

    .line 24
    .line 25
    invoke-virtual {p4, v1}, Ljava/io/OutputStream;->write(I)V

    .line 26
    .line 27
    .line 28
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    mul-int/lit8 p3, p3, 0x2

    .line 32
    .line 33
    return p3
.end method

.method public initialiseDecodingTable()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    .line 4
    .line 5
    array-length v3, v2

    .line 6
    if-ge v1, v3, :cond_0

    .line 7
    .line 8
    const/4 v3, -0x1

    .line 9
    aput-byte v3, v2, v1

    .line 10
    .line 11
    add-int/lit8 v1, v1, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    :goto_1
    iget-object v1, p0, Lorg/spongycastle/util/encoders/HexEncoder;->encodingTable:[B

    .line 15
    .line 16
    array-length v2, v1

    .line 17
    iget-object v3, p0, Lorg/spongycastle/util/encoders/HexEncoder;->decodingTable:[B

    .line 18
    .line 19
    if-ge v0, v2, :cond_1

    .line 20
    .line 21
    aget-byte v1, v1, v0

    .line 22
    .line 23
    int-to-byte v2, v0

    .line 24
    aput-byte v2, v3, v1

    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    const/16 p0, 0x61

    .line 30
    .line 31
    aget-byte p0, v3, p0

    .line 32
    .line 33
    const/16 v0, 0x41

    .line 34
    .line 35
    aput-byte p0, v3, v0

    .line 36
    .line 37
    const/16 p0, 0x62

    .line 38
    .line 39
    aget-byte p0, v3, p0

    .line 40
    .line 41
    const/16 v0, 0x42

    .line 42
    .line 43
    aput-byte p0, v3, v0

    .line 44
    .line 45
    const/16 p0, 0x63

    .line 46
    .line 47
    aget-byte p0, v3, p0

    .line 48
    .line 49
    const/16 v0, 0x43

    .line 50
    .line 51
    aput-byte p0, v3, v0

    .line 52
    .line 53
    const/16 p0, 0x64

    .line 54
    .line 55
    aget-byte p0, v3, p0

    .line 56
    .line 57
    const/16 v0, 0x44

    .line 58
    .line 59
    aput-byte p0, v3, v0

    .line 60
    .line 61
    const/16 p0, 0x65

    .line 62
    .line 63
    aget-byte p0, v3, p0

    .line 64
    .line 65
    const/16 v0, 0x45

    .line 66
    .line 67
    aput-byte p0, v3, v0

    .line 68
    .line 69
    const/16 p0, 0x66

    .line 70
    .line 71
    aget-byte p0, v3, p0

    .line 72
    .line 73
    const/16 v0, 0x46

    .line 74
    .line 75
    aput-byte p0, v3, v0

    .line 76
    .line 77
    return-void
.end method
