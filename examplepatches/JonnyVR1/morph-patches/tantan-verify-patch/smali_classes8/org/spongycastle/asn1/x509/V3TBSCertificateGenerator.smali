.class public Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private altNamePresentAndCritical:Z

.field endDate:Lorg/spongycastle/asn1/x509/Time;

.field extensions:Lorg/spongycastle/asn1/x509/Extensions;

.field issuer:Lorg/spongycastle/asn1/x500/X500Name;

.field private issuerUniqueID:Lorg/spongycastle/asn1/DERBitString;

.field serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

.field signature:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

.field startDate:Lorg/spongycastle/asn1/x509/Time;

.field subject:Lorg/spongycastle/asn1/x500/X500Name;

.field subjectPublicKeyInfo:Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

.field private subjectUniqueID:Lorg/spongycastle/asn1/DERBitString;

.field version:Lorg/spongycastle/asn1/DERTaggedObject;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 5
    .line 6
    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    .line 7
    .line 8
    const-wide/16 v2, 0x2

    .line 9
    .line 10
    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 11
    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-direct {v0, v2, v3, v1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->version:Lorg/spongycastle/asn1/DERTaggedObject;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public generateTBSCertificate()Lorg/spongycastle/asn1/x509/TBSCertificate;
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->signature:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 6
    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->issuer:Lorg/spongycastle/asn1/x500/X500Name;

    .line 10
    .line 11
    if-eqz v0, :cond_5

    .line 12
    .line 13
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->startDate:Lorg/spongycastle/asn1/x509/Time;

    .line 14
    .line 15
    if-eqz v0, :cond_5

    .line 16
    .line 17
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->endDate:Lorg/spongycastle/asn1/x509/Time;

    .line 18
    .line 19
    if-eqz v0, :cond_5

    .line 20
    .line 21
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->subject:Lorg/spongycastle/asn1/x500/X500Name;

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-boolean v0, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->altNamePresentAndCritical:Z

    .line 26
    .line 27
    if-eqz v0, :cond_5

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->subjectPublicKeyInfo:Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    .line 30
    .line 31
    if-eqz v0, :cond_5

    .line 32
    .line 33
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 34
    .line 35
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->version:Lorg/spongycastle/asn1/DERTaggedObject;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->signature:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->issuer:Lorg/spongycastle/asn1/x500/X500Name;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 56
    .line 57
    .line 58
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 59
    .line 60
    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 61
    .line 62
    .line 63
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->startDate:Lorg/spongycastle/asn1/x509/Time;

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->endDate:Lorg/spongycastle/asn1/x509/Time;

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 71
    .line 72
    .line 73
    new-instance v2, Lorg/spongycastle/asn1/DERSequence;

    .line 74
    .line 75
    invoke-direct {v2, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->subject:Lorg/spongycastle/asn1/x500/X500Name;

    .line 82
    .line 83
    if-eqz v1, :cond_1

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    .line 90
    .line 91
    invoke-direct {v1}, Lorg/spongycastle/asn1/DERSequence;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 95
    .line 96
    .line 97
    :goto_0
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->subjectPublicKeyInfo:Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->issuerUniqueID:Lorg/spongycastle/asn1/DERBitString;

    .line 103
    .line 104
    const/4 v2, 0x1

    .line 105
    const/4 v3, 0x0

    .line 106
    if-eqz v1, :cond_2

    .line 107
    .line 108
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 109
    .line 110
    iget-object v4, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->issuerUniqueID:Lorg/spongycastle/asn1/DERBitString;

    .line 111
    .line 112
    invoke-direct {v1, v3, v2, v4}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 116
    .line 117
    .line 118
    :cond_2
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->subjectUniqueID:Lorg/spongycastle/asn1/DERBitString;

    .line 119
    .line 120
    if-eqz v1, :cond_3

    .line 121
    .line 122
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 123
    .line 124
    const/4 v4, 0x2

    .line 125
    iget-object v5, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->subjectUniqueID:Lorg/spongycastle/asn1/DERBitString;

    .line 126
    .line 127
    invoke-direct {v1, v3, v4, v5}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 131
    .line 132
    .line 133
    :cond_3
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    .line 134
    .line 135
    if-eqz v1, :cond_4

    .line 136
    .line 137
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 138
    .line 139
    const/4 v3, 0x3

    .line 140
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    .line 141
    .line 142
    invoke-direct {v1, v2, v3, p0}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 146
    .line 147
    .line 148
    :cond_4
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 149
    .line 150
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 151
    .line 152
    .line 153
    invoke-static {p0}, Lorg/spongycastle/asn1/x509/TBSCertificate;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/TBSCertificate;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    return-object p0

    .line 158
    :cond_5
    const-string p0, "not all mandatory fields set in V3 TBScertificate generator"

    .line 159
    .line 160
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    const/4 p0, 0x0

    .line 164
    return-object p0
.end method

.method public setEndDate(Lorg/spongycastle/asn1/ASN1UTCTime;)V
    .locals 1

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/x509/Time;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/x509/Time;-><init>(Lorg/spongycastle/asn1/ASN1Primitive;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->endDate:Lorg/spongycastle/asn1/x509/Time;

    .line 7
    .line 8
    return-void
.end method

.method public setEndDate(Lorg/spongycastle/asn1/x509/Time;)V
    .locals 0

    .line 9
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->endDate:Lorg/spongycastle/asn1/x509/Time;

    return-void
.end method

.method public setExtensions(Lorg/spongycastle/asn1/x509/Extensions;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->subjectAlternativeName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/x509/Extensions;->getExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x509/Extension;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/Extension;->isCritical()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->altNamePresentAndCritical:Z

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public setExtensions(Lorg/spongycastle/asn1/x509/X509Extensions;)V
    .locals 0

    .line 23
    invoke-static {p1}, Lorg/spongycastle/asn1/x509/Extensions;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->setExtensions(Lorg/spongycastle/asn1/x509/Extensions;)V

    return-void
.end method

.method public setIssuer(Lorg/spongycastle/asn1/x500/X500Name;)V
    .locals 0

    .line 8
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->issuer:Lorg/spongycastle/asn1/x500/X500Name;

    return-void
.end method

.method public setIssuer(Lorg/spongycastle/asn1/x509/X509Name;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/spongycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->issuer:Lorg/spongycastle/asn1/x500/X500Name;

    .line 6
    .line 7
    return-void
.end method

.method public setIssuerUniqueID(Lorg/spongycastle/asn1/DERBitString;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->issuerUniqueID:Lorg/spongycastle/asn1/DERBitString;

    .line 2
    .line 3
    return-void
.end method

.method public setSerialNumber(Lorg/spongycastle/asn1/ASN1Integer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    return-void
.end method

.method public setSignature(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->signature:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 2
    .line 3
    return-void
.end method

.method public setStartDate(Lorg/spongycastle/asn1/ASN1UTCTime;)V
    .locals 1

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/x509/Time;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/x509/Time;-><init>(Lorg/spongycastle/asn1/ASN1Primitive;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->startDate:Lorg/spongycastle/asn1/x509/Time;

    .line 7
    .line 8
    return-void
.end method

.method public setStartDate(Lorg/spongycastle/asn1/x509/Time;)V
    .locals 0

    .line 9
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->startDate:Lorg/spongycastle/asn1/x509/Time;

    return-void
.end method

.method public setSubject(Lorg/spongycastle/asn1/x500/X500Name;)V
    .locals 0

    .line 12
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->subject:Lorg/spongycastle/asn1/x500/X500Name;

    return-void
.end method

.method public setSubject(Lorg/spongycastle/asn1/x509/X509Name;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/X509Name;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lorg/spongycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->subject:Lorg/spongycastle/asn1/x500/X500Name;

    .line 10
    .line 11
    return-void
.end method

.method public setSubjectPublicKeyInfo(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->subjectPublicKeyInfo:Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setSubjectUniqueID(Lorg/spongycastle/asn1/DERBitString;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/V3TBSCertificateGenerator;->subjectUniqueID:Lorg/spongycastle/asn1/DERBitString;

    .line 2
    .line 3
    return-void
.end method
