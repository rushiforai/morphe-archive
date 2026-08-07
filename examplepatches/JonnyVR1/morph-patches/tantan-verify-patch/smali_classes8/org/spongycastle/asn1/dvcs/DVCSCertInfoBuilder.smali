.class public Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final DEFAULT_VERSION:I = 0x1

.field private static final TAG_CERTS:I = 0x3

.field private static final TAG_DV_STATUS:I = 0x0

.field private static final TAG_POLICY:I = 0x1

.field private static final TAG_REQ_SIGNATURE:I = 0x2


# instance fields
.field private certs:Lorg/spongycastle/asn1/ASN1Sequence;

.field private dvReqInfo:Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

.field private dvStatus:Lorg/spongycastle/asn1/cmp/PKIStatusInfo;

.field private extensions:Lorg/spongycastle/asn1/x509/Extensions;

.field private messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

.field private policy:Lorg/spongycastle/asn1/x509/PolicyInformation;

.field private reqSignature:Lorg/spongycastle/asn1/ASN1Set;

.field private responseTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

.field private serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

.field private version:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;Lorg/spongycastle/asn1/x509/DigestInfo;Lorg/spongycastle/asn1/ASN1Integer;Lorg/spongycastle/asn1/dvcs/DVCSTime;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->version:I

    .line 6
    .line 7
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->dvReqInfo:Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

    .line 8
    .line 9
    iput-object p2, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

    .line 10
    .line 11
    iput-object p3, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

    .line 12
    .line 13
    iput-object p4, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->responseTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public build()Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;
    .locals 6

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->version:I

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-eq v1, v2, :cond_0

    .line 10
    .line 11
    new-instance v3, Lorg/spongycastle/asn1/ASN1Integer;

    .line 12
    .line 13
    int-to-long v4, v1

    .line 14
    invoke-direct {v3, v4, v5}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->dvReqInfo:Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->responseTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->dvStatus:Lorg/spongycastle/asn1/cmp/PKIStatusInfo;

    .line 41
    .line 42
    const/4 v3, 0x0

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 46
    .line 47
    iget-object v4, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->dvStatus:Lorg/spongycastle/asn1/cmp/PKIStatusInfo;

    .line 48
    .line 49
    invoke-direct {v1, v3, v3, v4}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->policy:Lorg/spongycastle/asn1/x509/PolicyInformation;

    .line 56
    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 60
    .line 61
    iget-object v4, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->policy:Lorg/spongycastle/asn1/x509/PolicyInformation;

    .line 62
    .line 63
    invoke-direct {v1, v3, v2, v4}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 67
    .line 68
    .line 69
    :cond_2
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->reqSignature:Lorg/spongycastle/asn1/ASN1Set;

    .line 70
    .line 71
    if-eqz v1, :cond_3

    .line 72
    .line 73
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 74
    .line 75
    const/4 v2, 0x2

    .line 76
    iget-object v4, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->reqSignature:Lorg/spongycastle/asn1/ASN1Set;

    .line 77
    .line 78
    invoke-direct {v1, v3, v2, v4}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 82
    .line 83
    .line 84
    :cond_3
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 85
    .line 86
    if-eqz v1, :cond_4

    .line 87
    .line 88
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 89
    .line 90
    const/4 v2, 0x3

    .line 91
    iget-object v4, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 92
    .line 93
    invoke-direct {v1, v3, v2, v4}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 97
    .line 98
    .line 99
    :cond_4
    iget-object p0, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    .line 100
    .line 101
    if-eqz p0, :cond_5

    .line 102
    .line 103
    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 104
    .line 105
    .line 106
    :cond_5
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 107
    .line 108
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 109
    .line 110
    .line 111
    invoke-static {p0}, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    return-object p0
.end method

.method public setCerts([Lorg/spongycastle/asn1/dvcs/TargetEtcChain;)V
    .locals 1

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/DERSequence;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DERSequence;-><init>([Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 7
    .line 8
    return-void
.end method

.method public setDvReqInfo(Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->dvReqInfo:Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

    .line 2
    .line 3
    return-void
.end method

.method public setDvStatus(Lorg/spongycastle/asn1/cmp/PKIStatusInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->dvStatus:Lorg/spongycastle/asn1/cmp/PKIStatusInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setExtensions(Lorg/spongycastle/asn1/x509/Extensions;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    .line 2
    .line 3
    return-void
.end method

.method public setMessageImprint(Lorg/spongycastle/asn1/x509/DigestInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setPolicy(Lorg/spongycastle/asn1/x509/PolicyInformation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->policy:Lorg/spongycastle/asn1/x509/PolicyInformation;

    .line 2
    .line 3
    return-void
.end method

.method public setReqSignature(Lorg/spongycastle/asn1/ASN1Set;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->reqSignature:Lorg/spongycastle/asn1/ASN1Set;

    .line 2
    .line 3
    return-void
.end method

.method public setResponseTime(Lorg/spongycastle/asn1/dvcs/DVCSTime;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->responseTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

    .line 2
    .line 3
    return-void
.end method

.method public setSerialNumber(Lorg/spongycastle/asn1/ASN1Integer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    return-void
.end method

.method public setVersion(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfoBuilder;->version:I

    .line 2
    .line 3
    return-void
.end method
