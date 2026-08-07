.class public Lorg/spongycastle/asn1/x509/Holder;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"


# static fields
.field public static final V1_CERTIFICATE_HOLDER:I = 0x0

.field public static final V2_CERTIFICATE_HOLDER:I = 0x1


# instance fields
.field baseCertificateID:Lorg/spongycastle/asn1/x509/IssuerSerial;

.field entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

.field objectDigestInfo:Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

.field private version:I


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    .line 6
    .line 7
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x3

    .line 12
    const/4 v3, 0x0

    .line 13
    if-gt v1, v2, :cond_4

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    move v2, v1

    .line 17
    :goto_0
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-eq v2, v4, :cond_3

    .line 22
    .line 23
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-static {v4}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    if-eqz v5, :cond_2

    .line 36
    .line 37
    if-eq v5, v0, :cond_1

    .line 38
    .line 39
    const/4 v6, 0x2

    .line 40
    if-ne v5, v6, :cond_0

    .line 41
    .line 42
    invoke-static {v4, v1}, Lorg/spongycastle/asn1/x509/ObjectDigestInfo;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    iput-object v4, p0, Lorg/spongycastle/asn1/x509/Holder;->objectDigestInfo:Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_0
    const-string p0, "unknown tag in Holder"

    .line 50
    .line 51
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw v3

    .line 55
    :cond_1
    invoke-static {v4, v1}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    iput-object v4, p0, Lorg/spongycastle/asn1/x509/Holder;->entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    invoke-static {v4, v1}, Lorg/spongycastle/asn1/x509/IssuerSerial;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/IssuerSerial;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    iput-object v4, p0, Lorg/spongycastle/asn1/x509/Holder;->baseCertificateID:Lorg/spongycastle/asn1/x509/IssuerSerial;

    .line 67
    .line 68
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    iput v0, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    .line 72
    .line 73
    return-void

    .line 74
    :cond_4
    const-string p0, "Bad sequence size: "

    .line 75
    .line 76
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    invoke-static {p0, p1}, Ll/pvb;->a(Ljava/lang/String;I)V

    .line 81
    .line 82
    .line 83
    throw v3
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V
    .locals 2

    .line 84
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    const/4 v0, 0x1

    .line 85
    iput v0, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    .line 86
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v1

    if-eqz v1, :cond_1

    if-ne v1, v0, :cond_0

    .line 87
    invoke-static {p1, v0}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object p1

    iput-object p1, p0, Lorg/spongycastle/asn1/x509/Holder;->entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

    goto :goto_0

    .line 88
    :cond_0
    const-string p0, "unknown tag in Holder"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    .line 89
    :cond_1
    invoke-static {p1, v0}, Lorg/spongycastle/asn1/x509/IssuerSerial;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/IssuerSerial;

    move-result-object p1

    iput-object p1, p0, Lorg/spongycastle/asn1/x509/Holder;->baseCertificateID:Lorg/spongycastle/asn1/x509/IssuerSerial;

    :goto_0
    const/4 p1, 0x0

    .line 90
    iput p1, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/GeneralNames;)V
    .locals 1

    const/4 v0, 0x1

    .line 95
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/asn1/x509/Holder;-><init>(Lorg/spongycastle/asn1/x509/GeneralNames;I)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/GeneralNames;I)V
    .locals 0

    .line 96
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 97
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/Holder;->entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 98
    iput p2, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/IssuerSerial;)V
    .locals 1

    const/4 v0, 0x1

    .line 91
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/asn1/x509/Holder;-><init>(Lorg/spongycastle/asn1/x509/IssuerSerial;I)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/IssuerSerial;I)V
    .locals 0

    .line 92
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 93
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/Holder;->baseCertificateID:Lorg/spongycastle/asn1/x509/IssuerSerial;

    .line 94
    iput p2, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/ObjectDigestInfo;)V
    .locals 1

    .line 99
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    const/4 v0, 0x1

    .line 100
    iput v0, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    .line 101
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/Holder;->objectDigestInfo:Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Holder;
    .locals 1

    .line 1
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/Holder;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lorg/spongycastle/asn1/x509/Holder;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Lorg/spongycastle/asn1/x509/Holder;

    .line 13
    .line 14
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x509/Holder;-><init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V

    .line 19
    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_1
    if-eqz p0, :cond_2

    .line 23
    .line 24
    new-instance v0, Lorg/spongycastle/asn1/x509/Holder;

    .line 25
    .line 26
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x509/Holder;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    .line 31
    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_2
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method


# virtual methods
.method public getBaseCertificateID()Lorg/spongycastle/asn1/x509/IssuerSerial;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/Holder;->baseCertificateID:Lorg/spongycastle/asn1/x509/IssuerSerial;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEntityName()Lorg/spongycastle/asn1/x509/GeneralNames;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/Holder;->entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 2
    .line 3
    return-object p0
.end method

.method public getObjectDigestInfo()Lorg/spongycastle/asn1/x509/ObjectDigestInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/Holder;->objectDigestInfo:Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVersion()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    .line 2
    .line 3
    return p0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 5

    .line 1
    iget v0, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne v0, v2, :cond_3

    .line 6
    .line 7
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 8
    .line 9
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/Holder;->baseCertificateID:Lorg/spongycastle/asn1/x509/IssuerSerial;

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    new-instance v3, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 17
    .line 18
    iget-object v4, p0, Lorg/spongycastle/asn1/x509/Holder;->baseCertificateID:Lorg/spongycastle/asn1/x509/IssuerSerial;

    .line 19
    .line 20
    invoke-direct {v3, v1, v1, v4}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/Holder;->entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    new-instance v3, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 31
    .line 32
    iget-object v4, p0, Lorg/spongycastle/asn1/x509/Holder;->entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 33
    .line 34
    invoke-direct {v3, v1, v2, v4}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/Holder;->objectDigestInfo:Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    .line 41
    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    new-instance v2, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 45
    .line 46
    const/4 v3, 0x2

    .line 47
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/Holder;->objectDigestInfo:Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    .line 48
    .line 49
    invoke-direct {v2, v1, v3, p0}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 56
    .line 57
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 58
    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_3
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/Holder;->entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 62
    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 66
    .line 67
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/Holder;->entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 68
    .line 69
    invoke-direct {v0, v2, v2, p0}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 70
    .line 71
    .line 72
    return-object v0

    .line 73
    :cond_4
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 74
    .line 75
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/Holder;->baseCertificateID:Lorg/spongycastle/asn1/x509/IssuerSerial;

    .line 76
    .line 77
    invoke-direct {v0, v2, v1, p0}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 78
    .line 79
    .line 80
    return-object v0
.end method
