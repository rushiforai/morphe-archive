.class public Lorg/spongycastle/asn1/cms/CompressedDataParser;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private _compressionAlgorithm:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

.field private _encapContentInfo:Lorg/spongycastle/asn1/cms/ContentInfoParser;

.field private _version:Lorg/spongycastle/asn1/ASN1Integer;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1SequenceParser;)V
    .locals 1
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
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1SequenceParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 9
    .line 10
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/CompressedDataParser;->_version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 11
    .line 12
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1SequenceParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/CompressedDataParser;->_compressionAlgorithm:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 25
    .line 26
    new-instance v0, Lorg/spongycastle/asn1/cms/ContentInfoParser;

    .line 27
    .line 28
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1SequenceParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lorg/spongycastle/asn1/ASN1SequenceParser;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/cms/ContentInfoParser;-><init>(Lorg/spongycastle/asn1/ASN1SequenceParser;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/CompressedDataParser;->_encapContentInfo:Lorg/spongycastle/asn1/cms/ContentInfoParser;

    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public getCompressionAlgorithmIdentifier()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cms/CompressedDataParser;->_compressionAlgorithm:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEncapContentInfo()Lorg/spongycastle/asn1/cms/ContentInfoParser;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cms/CompressedDataParser;->_encapContentInfo:Lorg/spongycastle/asn1/cms/ContentInfoParser;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVersion()Lorg/spongycastle/asn1/ASN1Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cms/CompressedDataParser;->_version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    return-object p0
.end method
