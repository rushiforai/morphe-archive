.class Lorg/spongycastle/asn1/ConstructedOctetStream;
.super Ljava/io/InputStream;
.source "SourceFile"


# instance fields
.field private _currentStream:Ljava/io/InputStream;

.field private _first:Z

.field private final _parser:Lorg/spongycastle/asn1/ASN1StreamParser;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_first:Z

    .line 6
    .line 7
    iput-object p1, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_parser:Lorg/spongycastle/asn1/ASN1StreamParser;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    iget-object v0, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_currentStream:Ljava/io/InputStream;

    const/4 v1, -0x1

    if-nez v0, :cond_2

    .line 73
    iget-boolean v0, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_first:Z

    if-nez v0, :cond_0

    return v1

    .line 74
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_parser:Lorg/spongycastle/asn1/ASN1StreamParser;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1StreamParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1OctetStringParser;

    if-nez v0, :cond_1

    return v1

    :cond_1
    const/4 v2, 0x0

    .line 75
    iput-boolean v2, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_first:Z

    .line 76
    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1OctetStringParser;->getOctetStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_currentStream:Ljava/io/InputStream;

    .line 77
    :cond_2
    :goto_0
    iget-object v0, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_currentStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    if-ltz v0, :cond_3

    return v0

    .line 78
    :cond_3
    iget-object v0, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_parser:Lorg/spongycastle/asn1/ASN1StreamParser;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1StreamParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1OctetStringParser;

    if-nez v0, :cond_4

    const/4 v0, 0x0

    .line 79
    iput-object v0, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_currentStream:Ljava/io/InputStream;

    return v1

    .line 80
    :cond_4
    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1OctetStringParser;->getOctetStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_currentStream:Ljava/io/InputStream;

    goto :goto_0
.end method

.method public read([BII)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_currentStream:Ljava/io/InputStream;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, -0x1

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-boolean v0, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_first:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return v2

    .line 12
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_parser:Lorg/spongycastle/asn1/ASN1StreamParser;

    .line 13
    .line 14
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1StreamParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lorg/spongycastle/asn1/ASN1OctetStringParser;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    return v2

    .line 23
    :cond_1
    iput-boolean v1, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_first:Z

    .line 24
    .line 25
    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1OctetStringParser;->getOctetStream()Ljava/io/InputStream;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_currentStream:Ljava/io/InputStream;

    .line 30
    .line 31
    :cond_2
    :goto_0
    iget-object v0, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_currentStream:Ljava/io/InputStream;

    .line 32
    .line 33
    add-int v3, p2, v1

    .line 34
    .line 35
    sub-int v4, p3, v1

    .line 36
    .line 37
    invoke-virtual {v0, p1, v3, v4}, Ljava/io/InputStream;->read([BII)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-ltz v0, :cond_3

    .line 42
    .line 43
    add-int/2addr v1, v0

    .line 44
    if-ne v1, p3, :cond_2

    .line 45
    .line 46
    return v1

    .line 47
    :cond_3
    iget-object v0, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_parser:Lorg/spongycastle/asn1/ASN1StreamParser;

    .line 48
    .line 49
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1StreamParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lorg/spongycastle/asn1/ASN1OctetStringParser;

    .line 54
    .line 55
    if-nez v0, :cond_5

    .line 56
    .line 57
    const/4 p1, 0x0

    .line 58
    iput-object p1, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_currentStream:Ljava/io/InputStream;

    .line 59
    .line 60
    const/4 p0, 0x1

    .line 61
    if-ge v1, p0, :cond_4

    .line 62
    .line 63
    return v2

    .line 64
    :cond_4
    return v1

    .line 65
    :cond_5
    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1OctetStringParser;->getOctetStream()Ljava/io/InputStream;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Lorg/spongycastle/asn1/ConstructedOctetStream;->_currentStream:Ljava/io/InputStream;

    .line 70
    .line 71
    goto :goto_0
.end method
