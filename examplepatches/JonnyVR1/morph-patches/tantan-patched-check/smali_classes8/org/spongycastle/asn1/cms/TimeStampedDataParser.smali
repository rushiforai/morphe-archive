.class public Lorg/spongycastle/asn1/cms/TimeStampedDataParser;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private content:Lorg/spongycastle/asn1/ASN1OctetStringParser;

.field private dataUri:Lorg/spongycastle/asn1/DERIA5String;

.field private metaData:Lorg/spongycastle/asn1/cms/MetaData;

.field private parser:Lorg/spongycastle/asn1/ASN1SequenceParser;

.field private temporalEvidence:Lorg/spongycastle/asn1/cms/Evidence;

.field private version:Lorg/spongycastle/asn1/ASN1Integer;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1SequenceParser;)V
    .locals 2
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
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/TimeStampedDataParser;->parser:Lorg/spongycastle/asn1/ASN1SequenceParser;

    .line 5
    .line 6
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1SequenceParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/TimeStampedDataParser;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 15
    .line 16
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1SequenceParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    instance-of v1, v0, Lorg/spongycastle/asn1/DERIA5String;

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-static {v0}, Lorg/spongycastle/asn1/DERIA5String;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERIA5String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/TimeStampedDataParser;->dataUri:Lorg/spongycastle/asn1/DERIA5String;

    .line 29
    .line 30
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1SequenceParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :cond_0
    instance-of v1, v0, Lorg/spongycastle/asn1/cms/MetaData;

    .line 35
    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    instance-of v1, v0, Lorg/spongycastle/asn1/ASN1SequenceParser;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    :cond_1
    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Lorg/spongycastle/asn1/cms/MetaData;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/MetaData;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/TimeStampedDataParser;->metaData:Lorg/spongycastle/asn1/cms/MetaData;

    .line 51
    .line 52
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1SequenceParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    :cond_2
    instance-of p1, v0, Lorg/spongycastle/asn1/ASN1OctetStringParser;

    .line 57
    .line 58
    if-eqz p1, :cond_3

    .line 59
    .line 60
    check-cast v0, Lorg/spongycastle/asn1/ASN1OctetStringParser;

    .line 61
    .line 62
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/TimeStampedDataParser;->content:Lorg/spongycastle/asn1/ASN1OctetStringParser;

    .line 63
    .line 64
    :cond_3
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/TimeStampedDataParser;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lorg/spongycastle/asn1/cms/TimeStampedDataParser;

    .line 6
    .line 7
    check-cast p0, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 8
    .line 9
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->parser()Lorg/spongycastle/asn1/ASN1SequenceParser;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/cms/TimeStampedDataParser;-><init>(Lorg/spongycastle/asn1/ASN1SequenceParser;)V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1SequenceParser;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Lorg/spongycastle/asn1/cms/TimeStampedDataParser;

    .line 22
    .line 23
    check-cast p0, Lorg/spongycastle/asn1/ASN1SequenceParser;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/cms/TimeStampedDataParser;-><init>(Lorg/spongycastle/asn1/ASN1SequenceParser;)V

    .line 26
    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method


# virtual methods
.method public getContent()Lorg/spongycastle/asn1/ASN1OctetStringParser;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cms/TimeStampedDataParser;->content:Lorg/spongycastle/asn1/ASN1OctetStringParser;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDataUri()Lorg/spongycastle/asn1/DERIA5String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cms/TimeStampedDataParser;->dataUri:Lorg/spongycastle/asn1/DERIA5String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMetaData()Lorg/spongycastle/asn1/cms/MetaData;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cms/TimeStampedDataParser;->metaData:Lorg/spongycastle/asn1/cms/MetaData;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTemporalEvidence()Lorg/spongycastle/asn1/cms/Evidence;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/TimeStampedDataParser;->temporalEvidence:Lorg/spongycastle/asn1/cms/Evidence;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/TimeStampedDataParser;->parser:Lorg/spongycastle/asn1/ASN1SequenceParser;

    .line 6
    .line 7
    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1SequenceParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lorg/spongycastle/asn1/cms/Evidence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/Evidence;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lorg/spongycastle/asn1/cms/TimeStampedDataParser;->temporalEvidence:Lorg/spongycastle/asn1/cms/Evidence;

    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Lorg/spongycastle/asn1/cms/TimeStampedDataParser;->temporalEvidence:Lorg/spongycastle/asn1/cms/Evidence;

    .line 22
    .line 23
    return-object p0
.end method
