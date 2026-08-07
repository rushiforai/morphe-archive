.class Lorg/spongycastle/asn1/DefiniteLengthInputStream;
.super Lorg/spongycastle/asn1/LimitedInputStream;
.source "SourceFile"


# static fields
.field private static final EMPTY_BYTES:[B


# instance fields
.field private final _originalLength:I

.field private _remaining:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    sput-object v0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->EMPTY_BYTES:[B

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/asn1/LimitedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 2
    .line 3
    .line 4
    if-ltz p2, :cond_1

    .line 5
    .line 6
    iput p2, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_originalLength:I

    .line 7
    .line 8
    iput p2, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_remaining:I

    .line 9
    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    invoke-virtual {p0, p1}, Lorg/spongycastle/asn1/LimitedInputStream;->setParentEofDetect(Z)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    const-string p0, "negative lengths not allowed"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    throw p0
.end method


# virtual methods
.method public getRemaining()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_remaining:I

    .line 2
    .line 3
    return p0
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 40
    iget v0, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_remaining:I

    if-nez v0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 41
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/asn1/LimitedInputStream;->_in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    if-ltz v0, :cond_2

    .line 42
    iget v1, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_remaining:I

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    iput v1, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_remaining:I

    if-nez v1, :cond_1

    .line 43
    invoke-virtual {p0, v2}, Lorg/spongycastle/asn1/LimitedInputStream;->setParentEofDetect(Z)V

    :cond_1
    return v0

    .line 44
    :cond_2
    iget v0, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_originalLength:I

    iget p0, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_remaining:I

    invoke-static {v0, p0}, Ll/bud;->a(II)V

    const/4 p0, 0x0

    return p0
.end method

.method public read([BII)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_remaining:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    iget-object v0, p0, Lorg/spongycastle/asn1/LimitedInputStream;->_in:Ljava/io/InputStream;

    .line 12
    .line 13
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-ltz p1, :cond_2

    .line 18
    .line 19
    iget p2, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_remaining:I

    .line 20
    .line 21
    sub-int/2addr p2, p1

    .line 22
    iput p2, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_remaining:I

    .line 23
    .line 24
    if-nez p2, :cond_1

    .line 25
    .line 26
    const/4 p2, 0x1

    .line 27
    invoke-virtual {p0, p2}, Lorg/spongycastle/asn1/LimitedInputStream;->setParentEofDetect(Z)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return p1

    .line 31
    :cond_2
    iget p1, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_originalLength:I

    .line 32
    .line 33
    iget p0, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_remaining:I

    .line 34
    .line 35
    invoke-static {p1, p0}, Ll/bud;->a(II)V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method public toByteArray()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_remaining:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->EMPTY_BYTES:[B

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-array v1, v0, [B

    .line 9
    .line 10
    iget-object v2, p0, Lorg/spongycastle/asn1/LimitedInputStream;->_in:Ljava/io/InputStream;

    .line 11
    .line 12
    invoke-static {v2, v1}, Lorg/spongycastle/util/io/Streams;->readFully(Ljava/io/InputStream;[B)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    sub-int/2addr v0, v2

    .line 17
    iput v0, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_remaining:I

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    invoke-virtual {p0, v0}, Lorg/spongycastle/asn1/LimitedInputStream;->setParentEofDetect(Z)V

    .line 23
    .line 24
    .line 25
    return-object v1

    .line 26
    :cond_1
    iget v0, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_originalLength:I

    .line 27
    .line 28
    iget p0, p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->_remaining:I

    .line 29
    .line 30
    invoke-static {v0, p0}, Ll/bud;->a(II)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    return-object p0
.end method
