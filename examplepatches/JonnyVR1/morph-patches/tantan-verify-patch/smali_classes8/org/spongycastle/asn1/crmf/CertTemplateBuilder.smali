.class public Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private extensions:Lorg/spongycastle/asn1/x509/Extensions;

.field private issuer:Lorg/spongycastle/asn1/x500/X500Name;

.field private issuerUID:Lorg/spongycastle/asn1/DERBitString;

.field private publicKey:Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

.field private serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

.field private signingAlg:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

.field private subject:Lorg/spongycastle/asn1/x500/X500Name;

.field private subjectUID:Lorg/spongycastle/asn1/DERBitString;

.field private validity:Lorg/spongycastle/asn1/crmf/OptionalValidity;

.field private version:Lorg/spongycastle/asn1/ASN1Integer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;IZLorg/spongycastle/asn1/ASN1Encodable;)V
    .locals 0

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    new-instance p0, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 4
    .line 5
    invoke-direct {p0, p3, p2, p4}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method


# virtual methods
.method public build()Lorg/spongycastle/asn1/crmf/CertTemplate;
    .locals 5

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {p0, v0, v2, v2, v1}, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;IZLorg/spongycastle/asn1/ASN1Encodable;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    invoke-direct {p0, v0, v3, v2, v1}, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;IZLorg/spongycastle/asn1/ASN1Encodable;)V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    iget-object v4, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->signingAlg:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 20
    .line 21
    invoke-direct {p0, v0, v1, v2, v4}, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;IZLorg/spongycastle/asn1/ASN1Encodable;)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    iget-object v4, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->issuer:Lorg/spongycastle/asn1/x500/X500Name;

    .line 26
    .line 27
    invoke-direct {p0, v0, v1, v3, v4}, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;IZLorg/spongycastle/asn1/ASN1Encodable;)V

    .line 28
    .line 29
    .line 30
    const/4 v1, 0x4

    .line 31
    iget-object v4, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->validity:Lorg/spongycastle/asn1/crmf/OptionalValidity;

    .line 32
    .line 33
    invoke-direct {p0, v0, v1, v2, v4}, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;IZLorg/spongycastle/asn1/ASN1Encodable;)V

    .line 34
    .line 35
    .line 36
    const/4 v1, 0x5

    .line 37
    iget-object v4, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->subject:Lorg/spongycastle/asn1/x500/X500Name;

    .line 38
    .line 39
    invoke-direct {p0, v0, v1, v3, v4}, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;IZLorg/spongycastle/asn1/ASN1Encodable;)V

    .line 40
    .line 41
    .line 42
    const/4 v1, 0x6

    .line 43
    iget-object v3, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->publicKey:Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    .line 44
    .line 45
    invoke-direct {p0, v0, v1, v2, v3}, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;IZLorg/spongycastle/asn1/ASN1Encodable;)V

    .line 46
    .line 47
    .line 48
    const/4 v1, 0x7

    .line 49
    iget-object v3, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->issuerUID:Lorg/spongycastle/asn1/DERBitString;

    .line 50
    .line 51
    invoke-direct {p0, v0, v1, v2, v3}, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;IZLorg/spongycastle/asn1/ASN1Encodable;)V

    .line 52
    .line 53
    .line 54
    const/16 v1, 0x8

    .line 55
    .line 56
    iget-object v3, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->subjectUID:Lorg/spongycastle/asn1/DERBitString;

    .line 57
    .line 58
    invoke-direct {p0, v0, v1, v2, v3}, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;IZLorg/spongycastle/asn1/ASN1Encodable;)V

    .line 59
    .line 60
    .line 61
    const/16 v1, 0x9

    .line 62
    .line 63
    iget-object v3, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    .line 64
    .line 65
    invoke-direct {p0, v0, v1, v2, v3}, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;IZLorg/spongycastle/asn1/ASN1Encodable;)V

    .line 66
    .line 67
    .line 68
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 69
    .line 70
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p0}, Lorg/spongycastle/asn1/crmf/CertTemplate;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/crmf/CertTemplate;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0
.end method

.method public setExtensions(Lorg/spongycastle/asn1/x509/Extensions;)Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;
    .locals 0

    .line 10
    iput-object p1, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    return-object p0
.end method

.method public setExtensions(Lorg/spongycastle/asn1/x509/X509Extensions;)Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/spongycastle/asn1/x509/Extensions;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Extensions;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->setExtensions(Lorg/spongycastle/asn1/x509/Extensions;)Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setIssuer(Lorg/spongycastle/asn1/x500/X500Name;)Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->issuer:Lorg/spongycastle/asn1/x500/X500Name;

    .line 2
    .line 3
    return-object p0
.end method

.method public setIssuerUID(Lorg/spongycastle/asn1/DERBitString;)Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->issuerUID:Lorg/spongycastle/asn1/DERBitString;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPublicKey(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->publicKey:Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public setSerialNumber(Lorg/spongycastle/asn1/ASN1Integer;)Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public setSigningAlg(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;)Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->signingAlg:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 2
    .line 3
    return-object p0
.end method

.method public setSubject(Lorg/spongycastle/asn1/x500/X500Name;)Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->subject:Lorg/spongycastle/asn1/x500/X500Name;

    .line 2
    .line 3
    return-object p0
.end method

.method public setSubjectUID(Lorg/spongycastle/asn1/DERBitString;)Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->subjectUID:Lorg/spongycastle/asn1/DERBitString;

    .line 2
    .line 3
    return-object p0
.end method

.method public setValidity(Lorg/spongycastle/asn1/crmf/OptionalValidity;)Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->validity:Lorg/spongycastle/asn1/crmf/OptionalValidity;

    .line 2
    .line 3
    return-object p0
.end method

.method public setVersion(I)Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    int-to-long v1, p1

    .line 4
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lorg/spongycastle/asn1/crmf/CertTemplateBuilder;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 8
    .line 9
    return-object p0
.end method
