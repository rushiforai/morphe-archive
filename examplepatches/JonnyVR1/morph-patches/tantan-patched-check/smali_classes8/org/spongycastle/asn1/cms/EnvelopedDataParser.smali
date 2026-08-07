.class public Lorg/spongycastle/asn1/cms/EnvelopedDataParser;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private _nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

.field private _originatorInfoCalled:Z

.field private _seq:Lorg/spongycastle/asn1/ASN1SequenceParser;

.field private _version:Lorg/spongycastle/asn1/ASN1Integer;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1SequenceParser;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_seq:Lorg/spongycastle/asn1/ASN1SequenceParser;

    .line 5
    .line 6
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1SequenceParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getEncryptedContentInfo()Lorg/spongycastle/asn1/cms/EncryptedContentInfoParser;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_seq:Lorg/spongycastle/asn1/ASN1SequenceParser;

    .line 6
    .line 7
    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1SequenceParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    check-cast v0, Lorg/spongycastle/asn1/ASN1SequenceParser;

    .line 19
    .line 20
    iput-object v1, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 21
    .line 22
    new-instance p0, Lorg/spongycastle/asn1/cms/EncryptedContentInfoParser;

    .line 23
    .line 24
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/cms/EncryptedContentInfoParser;-><init>(Lorg/spongycastle/asn1/ASN1SequenceParser;)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    return-object v1
.end method

.method public getOriginatorInfo()Lorg/spongycastle/asn1/cms/OriginatorInfo;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_originatorInfoCalled:Z

    .line 3
    .line 4
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_seq:Lorg/spongycastle/asn1/ASN1SequenceParser;

    .line 9
    .line 10
    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1SequenceParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 17
    .line 18
    instance-of v1, v0, Lorg/spongycastle/asn1/ASN1TaggedObjectParser;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObjectParser;

    .line 24
    .line 25
    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1TaggedObjectParser;->getTagNo()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 32
    .line 33
    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObjectParser;

    .line 34
    .line 35
    const/16 v1, 0x10

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    invoke-interface {v0, v1, v3}, Lorg/spongycastle/asn1/ASN1TaggedObjectParser;->getObjectParser(IZ)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lorg/spongycastle/asn1/ASN1SequenceParser;

    .line 43
    .line 44
    iput-object v2, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 45
    .line 46
    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Lorg/spongycastle/asn1/cms/OriginatorInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/OriginatorInfo;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_1
    return-object v2
.end method

.method public getRecipientInfos()Lorg/spongycastle/asn1/ASN1SetParser;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_originatorInfoCalled:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->getOriginatorInfo()Lorg/spongycastle/asn1/cms/OriginatorInfo;

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_seq:Lorg/spongycastle/asn1/ASN1SequenceParser;

    .line 13
    .line 14
    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1SequenceParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 21
    .line 22
    check-cast v0, Lorg/spongycastle/asn1/ASN1SetParser;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    iput-object v1, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 26
    .line 27
    return-object v0
.end method

.method public getUnprotectedAttrs()Lorg/spongycastle/asn1/ASN1SetParser;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_seq:Lorg/spongycastle/asn1/ASN1SequenceParser;

    .line 6
    .line 7
    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1SequenceParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iput-object v1, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_nextObject:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 19
    .line 20
    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObjectParser;

    .line 21
    .line 22
    const/16 p0, 0x11

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-interface {v0, p0, v1}, Lorg/spongycastle/asn1/ASN1TaggedObjectParser;->getObjectParser(IZ)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lorg/spongycastle/asn1/ASN1SetParser;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_1
    return-object v1
.end method

.method public getVersion()Lorg/spongycastle/asn1/ASN1Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cms/EnvelopedDataParser;->_version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    return-object p0
.end method
